package util

import (
	"fmt"
	"os"
	"text/template"
	"os/exec"
	"io"
	"strings"
	"bytes"

	"server-compiler-code/models"
)

const foundrySrcPath string = "foundry/src"
const foundryTestPath string = "foundry/test"

func CopyFileTestToUserFolder(uuid string,codeID string) (error) {

	folderTestUserPath := foundryTestPath + "/" + uuid
	fileTestUserPath := folderTestUserPath + "/" + codeID + ".t.sol"

	// Check if the file exists
	_, err := os.Stat(fileTestUserPath)
	if os.IsNotExist(err) {

		// Read the template file
		templateFilePath := foundryTestPath + "/template/" + codeID + ".t.sol.tmpl"
		// Create the Test if it doesn't exist
		errTest := os.MkdirAll(folderTestUserPath, 0755)
		if errTest != nil {
			return fmt.Errorf("Error creating Folder User Test: %s\n", err.Error())
		}

		tmpl, err := template.ParseFiles(templateFilePath)
		if err != nil {
			return fmt.Errorf("Error reading template: %s\n", err.Error())
		}
		// Generate the output by populating the template with data
		outputFile, err := os.Create(fileTestUserPath)
		if err != nil {
			return fmt.Errorf("Error creating output file: %s\n", err.Error())
		}
		defer outputFile.Close()

		err = tmpl.Execute(outputFile, struct {
			FolderUuid string
		}{ uuid })
		if err != nil {
			return fmt.Errorf("Error executing template: %s\n", err.Error())
		}

	} else if err != nil {
		return fmt.Errorf("Error checking file: %s\n", err.Error())
	}

	return nil
}

func ExecuteCodeTest(uuid string, codeID string) (string, error) {

	folderTestUserPath := foundryTestPath + "/" + uuid
	fileTestUserPath := folderTestUserPath + "/" + codeID + ".t.sol"

	cmd := exec.Command("forge", "test", "--match-path", fileTestUserPath)
	// cmd := exec.Command("forge", "test", "--match-contract", fileTestRegex)

	// Set up standard input and output buffers to interact with the command
	var stdout, stderr bytes.Buffer
	// cmd.Stdin = bytes.NewReader(code)
	cmd.Stdout = &stdout
	cmd.Stderr = &stderr

	// Run the command
	err := cmd.Run()
	if err != nil {
		return "", fmt.Errorf("execution failed: %s\nstderr: %s", err.Error(), stderr.String())
	}

	return stdout.String(), nil
}

func SaveCodeFile(code string, uuid string, codeID string) (error) {

	// Create and open the file
	folderSrcUserPath := foundrySrcPath + "/" + uuid
	filePath := folderSrcUserPath + "/" + codeID + ".sol"

	// Create the Test if it doesn't exist
	err := os.MkdirAll(folderSrcUserPath, 0755)
	if err != nil {
		return fmt.Errorf("Error creating Folder User Test: %s\n", err.Error())
	}

	file, err := os.Create(filePath)
	if err != nil {
		return fmt.Errorf("Error creating file: %s\n", err.Error())
	}
	defer file.Close()

	// Copy the request body to the file
	_, err = io.Copy(file, strings.NewReader(code))
	if err != nil {
		return fmt.Errorf("Failed to write request to file: %s", err.Error())
	}

	return nil
}

func WorkFlowExecuteCode(submission models.Submission) (string, error) {

	code := submission.Code
	codeID := submission.CodeID
	uuid := submission.Uuid

	err := SaveCodeFile(code, uuid, codeID)
	if err != nil {
		return "", fmt.Errorf("Failed to write request to file: %s", err.Error())
	}

	// Copy folder Test
	err = CopyFileTestToUserFolder(uuid, codeID)
	if err != nil {
		return "", fmt.Errorf("Copy File Test Fail: %s", err.Error())
	}

	// Execute the code
	output, err := ExecuteCodeTest(uuid, codeID)
	if err != nil {
		return "", fmt.Errorf("Execution failed: %s", err.Error())
	}

	return output, nil

}
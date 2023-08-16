package handlers

import (
	"fmt"
	"net/http"
	// "encoding/json"

	"github.com/gin-gonic/gin"

	"server-compiler-code/models"
	"server-compiler-code/util"
)

// ExecuteCodeHandler writes the request body to a file.
//	@Summary		Write to File
//	@Description	Writes the request body to a file.
//	@Accept			json
//	@Produce		json
//	@Param			submission	body		models.Submission	true	"Submission JSON"
//	@Success		200			{object}	gin.H
//	@Failure		500			{object}	gin.H
//	@Router			/execute-code [post]
func ExecuteCodeHandler(c *gin.Context) {

	var _submission models.Submission

	// Call BindJSON to bind the received JSON to
	// _submission.
	if err := c.BindJSON(&_submission); err != nil {
		return
	}

	output, err := util.WorkFlowExecuteCode(_submission)
	if err != nil {
		c.JSON(http.StatusOK, gin.H{
			"codeId": _submission.CodeID,
			"status": "failed",
			"output": fmt.Sprintf("%s\n%s", output, err.Error()),
			"task": "test",
			"error": map[string]string{"type":"error"},
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"codeId": _submission.CodeID,
		"status": "passed",
		"output": output,
		"task": "test",
		"error": nil,
	})
}

// ExecuteCodeTestHandler writes the request body to a file.
//	@Summary		Execute Code Test
//	@Description	Writes the request body to a file and run test.
//	@Accept			json
//	@Produce		json
//	@Param			SubmissionTest	body		models.SubmissionTest	true	"SubmissionTest JSON"
//	@Success		200				{object}	gin.H
//	@Failure		500				{object}	gin.H
//	@Router			/execute-code-test [post]
func ExecuteCodeTestHandler(c *gin.Context) {
	var _submission models.SubmissionTest

	// Call BindJSON to bind the received JSON to
	// _submission.
	if err := c.BindJSON(&_submission); err != nil {
		return
	}

	// foundrySrcPath := "foundry/src"
	// foundryTestPath := "foundry/test"
	// fileName := "CodeTest.sol"
	// fileTestName := "CodeTest.t.sol"
	// fileTestRegex := "CodeTest"

	// // Create the Src if it doesn't exist
	// err := os.MkdirAll(foundrySrcPath, 0755)
	// if err != nil {
	// 	c.JSON(http.StatusInternalServerError, gin.H{"error": fmt.Sprintf("Error creating Src: %s", err.Error())})
	// 	return
	// }

	// // Create the Test if it doesn't exist
	// errTest := os.MkdirAll(foundryTestPath, 0755)
	// if errTest != nil {
	// 	c.JSON(http.StatusInternalServerError, gin.H{"error": fmt.Sprintf("Error creating Test: %s", err.Error())})
	// 	return
	// }

	// // Create and open the file within the subfolder
	// filePath := foundrySrcPath + "/" + fileName
	// file, err := os.Create(filePath)
	// if err != nil {
	// 	c.JSON(http.StatusInternalServerError, gin.H{"error": fmt.Sprintf("Error creating file: %s", err.Error())})
	// 	return
	// }
	// defer file.Close()

	// // Copy the request body to the file
	// _, err = io.Copy(file, strings.NewReader(_submission.Code))
	// if err != nil {
	// 	c.JSON(http.StatusInternalServerError, gin.H{"error": fmt.Sprintf("Failed to write request to file: %s", err.Error())})
	// 	return
	// }

	// // Create and open the file within the subfolder
	// fileTestPath := foundryTestPath + "/" + fileTestName
	// fileTest, err := os.Create(fileTestPath)
	// if err != nil {
	// 	c.JSON(http.StatusInternalServerError, gin.H{"error": fmt.Sprintf("Error creating file: %s", err.Error())})
	// 	return
	// }
	// defer fileTest.Close()

	// // Copy the request body to the file
	// _, err = io.Copy(fileTest, strings.NewReader(_submission.CodeTest))
	// if err != nil {
	// 	c.JSON(http.StatusInternalServerError, gin.H{"error": fmt.Sprintf("Failed to write request to file: %s", err.Error())})
	// 	return
	// }

	// // Execute the code
	// output, err := util.executeCodeTest(fileTestRegex)
	// if err != nil {
	// 	c.JSON(http.StatusInternalServerError, gin.H{"error": fmt.Sprintf("Execution failed: %s", err.Error())})
	// 	return
	// }
	output := ""
	c.JSON(http.StatusOK, gin.H{"message": "Finish", "output": output})
}

// FormatCodeHandler .
//	@Summary		Format Code
//	@Description	Format Code.
//	@Accept			json
//	@Produce		json
//	@Param			submission	body		models.Submission	true	"Submission JSON"
//	@Success		200			{object}	gin.H
//	@Failure		500			{object}	gin.H
//	@Router			/format-code [post]
func FormatCodeHandler(c *gin.Context) {

	var _submission models.Submission

	// Call BindJSON to bind the received JSON to
	// _submission.
	if err := c.BindJSON(&_submission); err != nil {
		return
	}

	result, err := util.WorkFlowFormatCode(_submission)
	if err != nil {
		// http.StatusInternalServerError
		c.JSON(http.StatusOK, gin.H{
			"codeId": _submission.CodeID,
			"status": "failed",
			"output": result,
			"task": "format",
			"error": map[string]string{"type":"error"},
		})
		// "error": fmt.Sprintf("Execution failed: %s", err.Error()),
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"codeId": _submission.CodeID,
		"status": "passed",
		"output": result,
		"task": "format",
		"error": nil,
	})
}

// CompilerCodeHandler .
//	@Summary		Compiler Code
//	@Description	Compiler Code.
//	@Accept			json
//	@Produce		json
//	@Param			submission	body		models.Submission	true	"Submission JSON"
//	@Success		200			{object}	gin.H
//	@Failure		500			{object}	gin.H
//	@Router			/compiler-code [post]
func CompilerCodeHandler(c *gin.Context) {

	var _submission models.Submission

	// Call BindJSON to bind the received JSON to
	// _submission.
	if err := c.BindJSON(&_submission); err != nil {
		return
	}

	result, err := util.WorkFlowCompilerCode(_submission)
	if err != nil {
		// http.StatusInternalServerError
		c.JSON(http.StatusOK, gin.H{
			"codeId": _submission.CodeID,
			"status": "failed",
			"output": result,
			"task": "format",
			"error": map[string]string{"type":"error"},
		})
		// "error": fmt.Sprintf("Execution failed: %s", err.Error()),
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"codeId": _submission.CodeID,
		"status": "passed",
		"output": result,
		"task": "format",
		"error": nil,
	})
}
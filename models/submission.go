package models

// https://goswagger.io/use/spec/model.html

// Submission represents data about a Submission.
// swagger:model
type Submission struct {
	Code   string  `json:"code"`
	CodeID   string  `json:"code_id"`
	Uuid   string  `json:"uuid"`
}

// SubmissionTest represents data about a SubmissionTest.
// swagger:model
type SubmissionTest struct {
	Code   string  `json:"code"`
	CodeTest   string  `json:"code_test"`
}
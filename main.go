package main

import (
	// "fmt"
	// "io"
	// "os"
	"net/http"

	"github.com/gin-gonic/gin"
	swaggerFiles "github.com/swaggo/files"
   	ginSwagger "github.com/swaggo/gin-swagger"

	docs "server-compiler-code/docs"
	// "server-compiler-code/models"
	"server-compiler-code/handlers"
)

//	@BasePath	/api/v1

// PingExample godoc
//	@Summary	ping example
//	@Schemes
//	@Description	do ping
//	@Tags			example
//	@Accept			json
//	@Produce		json
//	@Success		200	{string}	Helloworld
//	@Router			/example/helloworld [get]
func Helloworld(g *gin.Context)  {
	g.JSON(http.StatusOK,"helloworld")
}

//	@title		Your Gin API
//	@version	1.0
//	@host		localhost:8080
//	@BasePath	/
func main() {
	r := gin.Default()
	docs.SwaggerInfo.BasePath = "/api/v1"
	v1 := r.Group("/api/v1")
	{
	   eg := v1.Group("/example")
	   {
		  eg.GET("/helloworld",Helloworld)
	   }

	   v1.POST("/execute-code", handlers.ExecuteCodeHandler)
	   v1.POST("/execute-code-test", handlers.ExecuteCodeTestHandler)
	   v1.POST("/format-code", handlers.FormatCodeHandler)
	}

	// r.POST("/writeToFile", writeToFileHandler)


	// Serve Swagger UI
	r.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))
	// Run the server on port 8080
	r.Run(":8080")
}
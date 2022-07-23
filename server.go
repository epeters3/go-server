package main

import (
	"fmt"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

func main() {
	fmt.Println("Starting up!")
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		now := time.Now().UTC()
		c.JSON(http.StatusOK, gin.H{
			"message": "Hello world!",
			"time":    now,
		})
	})
	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}

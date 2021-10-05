package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func handler(w http.ResponseWriter, r *http.Request) {
	message := os.Getenv("MESSAGE")
	if len(message) == 0 {
		message = "Hello"
	}
	environment := os.Getenv("ENVIRONMENT")
	fmt.Fprintf(w, "%s world! We're running in %s", message, environment)
}

func main() {
	fmt.Print("Starting 'hello-world-service'...")
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":8080", nil))
}

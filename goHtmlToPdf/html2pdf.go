package main

import (
	"context"
	"fmt"
	"io"
	"log"
	"net/http"
	"strconv"
	"strings"

	"github.com/aws/aws-lambda-go/lambda"

	// https://godoc.org/github.com/SebastiaanKlippert/go-wkhtmltopdf
	"github.com/SebastiaanKlippert/go-wkhtmltopdf"
)

type MyEvent struct {
	Name string `json:"name"`
}

func HandleRequest(ctx context.Context, name MyEvent) (string, error) {
	return fmt.Sprintf("Hello %s!", name.Name), nil
}

func main() {
	lambda.Start(HandleRequest)
}

func html2pdfHandler(w http.ResponseWriter, r *http.Request) {
	switch r.Method {
	case "GET":
		fmt.Fprintf(w, "Welcome on HTML2PDF!")
		//  http.ServeFile(w, r, "form.html")
	case "POST":
		htmlStr := new(strings.Builder)
		_, err := io.Copy(htmlStr, r.Body)
		if err != nil {
			log.Fatal(err)
		}

		// htmlStr := buf
		// fmt.Println("Received request")

		const path = "./wkhtmltopdf"
		wkhtmltopdf.SetPath(path)

		pdfg, err := wkhtmltopdf.NewPDFGenerator()
		if err != nil {
			log.Fatal(err)
		}

		// htmlStr := `<html><body><h1 style="color:red;">This is an html
		// from pdf to test color<h1><img src="http://api.qrserver.com/v1/create-qr-
		// code/?data=HelloWorld" alt="img" height="42" width="42"></img></body></html>`

		// fmt.Printf("String to process: %s \n", htmlStr)

		pdfg.AddPage(wkhtmltopdf.NewPageReader(strings.NewReader(htmlStr.String())))
		// fmt.Println("Page added")

		// Create PDF document in internal buffer
		err = pdfg.Create()
		if err != nil {
			fmt.Println("ERROR creating page")
			log.Fatal(err)
		}
		// fmt.Println("Page created")

		// //Your Pdf Name
		// err = pdfg.WriteFile("./Your_pdfname.pdf")
		// if err != nil {
		// 	log.Fatal(err)
		// }
		FileSize := len(pdfg.Bytes())
		// fmt.Printf("Response size: %d", FileSize)

		w.Header().Set("Content-Disposition", "attachment; filename=WHATEVER_YOU_WANT")
		w.Header().Set("Content-Type", r.Header.Get("Content-Type"))
		w.Header().Set("Content-Length", strconv.Itoa(FileSize))

		_, err = io.Copy(w, pdfg.Buffer())
		if err != nil {
			log.Fatal(err)
		}
	default:
		fmt.Fprintf(w, "Sorry, only GET and POST methods are supported.")
	}

	return
}

package main

import (
	"fmt"
	"github.com/quipo/statsd"
	"log"
	"net/http"
)

var stats *statsd.StatsdClient

func oneHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Page 1")
	stats.Incr("Page1", 1)
	log.Println("Incremented metric for Page 1")
}

func twoHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Page 2")
	stats.Incr("Page2", 1)
	log.Println("Incremented metric for Page 2")
}

func main() {
	http.HandleFunc("/one", oneHandler)
	http.HandleFunc("/two", twoHandler)
	log.Println("Connecting to Statsd")
	stats = statsd.NewStatsdClient("localhost:8125", "hits")
	err := stats.CreateSocket()
	if err != nil {
		log.Print(err)
	}
	log.Println("Successfully connected to StatsD")
	defer stats.Close()

	http.ListenAndServe(":8080", nil)
}

package main

import(
"encoding/json"
mdata "maersk/poc/cities/data"
"net/http"
)

func cityHandler(w http.ResponseWriter, r *http.Request) {
	query := r.URL.Query()
	citySearchCriteria := query["CitySearchCriteria"][0]

	cityList := mdata.RetrieveCitiesByName(citySearchCriteria)
	json,err:= json.Marshal(cityList)

	if err != nil {
		w.WriteHeader(500)
	} else {
		w.Header().Set("Content-Type","application/json")
		w.WriteHeader(200)
		w.Write(json)
	}
}

func main() {
	server := http.Server{
		Addr: "localhost:8080",
	}
	http.HandleFunc("/cities", cityHandler)

	server.ListenAndServe()
	
	

}

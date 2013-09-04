package main

import (
	"net/http"
	"github.com/jcelliott/lumber"
)

func redirHandler(w http.ResponseWriter, r *http.Request) {
  newDomain := "www." + r.Host
  lumber.Info("Domain: "+newDomain)
	http.Redirect(w, r, newDomain, http.StatusFound)
	return
}

func main() {
  http.HandleFunc("/", redirHandler)
  http.ListenAndServe(":80", nil)
}

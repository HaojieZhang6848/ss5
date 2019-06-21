package main

import (
	"log"
	"os"

	"github.com/armon/go-socks5"
)

func main() {

	var authenticator socks5.Authenticator
	if os.Getenv("USER") != "" {
		creadentials := socks5.StaticCredentials{
			os.Getenv("USER"): os.Getenv("PASSWORD")}

		authenticator = socks5.UserPassAuthenticator{Credentials: creadentials}
	} else {
		authenticator = socks5.NoAuthAuthenticator{}
	}

	// Create a SOCKS5 server
	config := &socks5.Config{
		AuthMethods: []socks5.Authenticator{authenticator},
		Logger:      log.New(os.Stdout, "", log.LstdFlags),
	}
	server, err := socks5.New(config)
	if err != nil {
		panic(err)
	}
	listen := os.Getenv("LISTEN")
	if listen == "" {
		listen = "127.0.0.1:1080"
	}
	if err := server.ListenAndServe("tcp", listen); err != nil {
		panic(err)
	}
}

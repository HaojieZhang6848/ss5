
all:
	go get github.com/armon/go-socks5
	CGO_ENABLED=0 go build -a -ldflags '-extldflags "-static"' -o server
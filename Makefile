
all:
	go mod tidy
	CGO_ENABLED=0 go build -a -ldflags '-extldflags "-static"' -o server
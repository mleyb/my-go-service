.PHONY: restore build clean deploy

restore:
	go get -v

build:
	env GOOS=linux go build -ldflags="-s -w" -o bin/hello hello/main.go
	env GOOS=linux go build -ldflags="-s -w" -o bin/world world/main.go

clean:
	rm -rf ./bin

deploy: restore clean build
	sls deploy --verbose

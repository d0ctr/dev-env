all: build

build:
	docker build --build-arg USER=workspace -t devcontainer -f Dockerfile.nvim .

run:
	docker run --rm -it  devcontainer:latest nvim


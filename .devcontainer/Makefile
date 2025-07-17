all: build

build:
	docker build -t devcontainter -f Dockerfile.workspace .

run:
	docker run --rm -it --user vscode devcontainter:latest nvim .config/nvim


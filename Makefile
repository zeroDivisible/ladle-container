.DEFAULT_GOAL := help

help:
	echo "Open this file to view the targets and run what you want."

build:
	docker build -t ladle .

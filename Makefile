.PHONY: main build push

main: push

build:
	sudo docker build -t jumski/elasticsearch:0.20.6 .

push: build
	sudo docker push jumski/elasticsearch:0.20.6

## created by Samih Hijwel - 7 Nov 2023


.PHONY: build
build:  ## build freeRadius image called my-freeradius-image
	@docker build -t my-freeradius-image -f Dockerfile .

.PHONY: run
run:	## run freeRadius in a docker container named 'my-freeradius'
	@docker run --rm -d --name my-freeradius -p 1812-1813:1812-1813/udp my-freeradius-image


.PHONY: stop
stop:   ## stops runing a docker container named 'my-freeradius'
	@docker stop my-freeradius

# .PHONY: start
# start:   ## starts runing a docker container named 'my-freeradius' (if it exists)
# 	@docker start my-freeradius

.PHONY: help
help:	## displays this help menu!
	@echo 'freeRadius ports are 1812-1813/udp'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


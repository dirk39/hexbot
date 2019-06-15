export UID := $(shell id -u)
export GID := $(shell id -g)

CMDS := install

PARAM =

ifneq ($(filter $(firstword $(MAKECMDGOALS)),$(CMDS)),)
	PARAM := $(filter-out $(firstword $(MAKECMDGOALS)), $(MAKECMDGOALS))	
	# The containers are not targets, let's make them silently fail
  $(eval $(PARAM):;@true)
endif

init:
	docker build -t hexbot-rust:1.0.0 .

start:
	docker run -dit --name=hexbot-rust -v ${PWD}/hexbot-wasm:/app hexbot-rust:1.0.0 sh 

run:
	docker exec --user ${UID}:${GID} hexbot-rust cargo run	

install: 
	docker exec --user ${UID}:${GID} hexbot-rust cargo install ${PARAM}	

stop:
	docker stop hexbot-rust

destroy: 
	docker rm -f hexbot-rust


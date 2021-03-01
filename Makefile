docker-build:
	docker-compose \
	-p cpp-traffic-sim \
	-f dcomposes/docker-compose.yml \
	build

basic-simulator:
	xhost + 127.0.0.1
	docker-compose \
	-p cpp-traffic-sim \
	-f dcomposes/docker-compose.basic.yml \
	run cpp

compile-simulator:
	xhost + 127.0.0.1
	docker-compose \
	-p cpp-traffic-sim \
	-f dcomposes/docker-compose.justcompile.yml \
	run cpp

debug-simulator:
	xhost + 127.0.0.1
	docker-compose \
	-p cpp-traffic-sim \
	-f dcomposes/docker-compose.debug.yml \
	run cpp

complete-simulator:
	xhost + 127.0.0.1
	docker-compose \
	-p cpp-traffic-sim \
	-f dcomposes/docker-compose.yml \
	run cpp

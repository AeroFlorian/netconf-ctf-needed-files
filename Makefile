VERSION=0.1

.PHONY: challenges cli all

challenges:
	docker build --file deploy/challenges/Dockerfile --label version=$(VERSION) --tag ctf_netconf_oran:v$(VERSION) .

cli:
	docker build --file deploy/cli/Dockerfile --label version=$(VERSION) --tag cli_ctf:v$(VERSION) .

all: challenges cli

launch_compose_dev:
	PREFIX="" docker-compose -f deploy/compose/docker-compose.yml up -d

launch_challenge: stop_compose
	PREFIX="airphone-docker-local.artifactory-espoo1.int.net.nokia.com/" CHALLENGE=$(CHALLENGE) docker-compose -f deploy/compose/docker-compose.yml up -d

launch_oran_challenge: stop_compose
	PREFIX="airphone-docker-local.artifactory-espoo1.int.net.nokia.com/" CHALLENGE=$(CHALLENGE) docker-compose -f deploy/compose/docker-compose-oran.yml up -d

launch_compose:
	PREFIX="airphone-docker-local.artifactory-espoo1.int.net.nokia.com/" docker-compose -f deploy/compose/docker-compose.yml up -d

stop_compose:
	docker-compose -f deploy/compose/docker-compose.yml down

enter_cli_container:
	docker exec -it cli_ctf /bin/bash

connect_cli:
	docker exec -it cli_ctf "./connect_to_server.py"


push_to_artifactory: all
	docker tag ctf_netconf_oran:v$(VERSION) airphone-docker-local.artifactory-espoo1.int.net.nokia.com/ctf_netconf_oran:v$(VERSION)
	docker tag cli_ctf:v$(VERSION) airphone-docker-local.artifactory-espoo1.int.net.nokia.com/cli_ctf:v$(VERSION)
	docker tag cli_ctf_oran:v$(VERSION) airphone-docker-local.artifactory-espoo1.int.net.nokia.com/cli_ctf_oran:v$(VERSION)
	docker tag ctf_oran_radio:v$(VERSION) airphone-docker-local.artifactory-espoo1.int.net.nokia.com/ctf_oran_radio:v$(VERSION)
	docker push airphone-docker-local.artifactory-espoo1.int.net.nokia.com/ctf_netconf_oran:v$(VERSION)
	docker push airphone-docker-local.artifactory-espoo1.int.net.nokia.com/cli_ctf:v$(VERSION)
	docker push airphone-docker-local.artifactory-espoo1.int.net.nokia.com/cli_ctf_oran:v$(VERSION)
	docker push airphone-docker-local.artifactory-espoo1.int.net.nokia.com/ctf_oran_radio:v$(VERSION)

pull_latest_images:
	PREFIX="airphone-docker-local.artifactory-espoo1.int.net.nokia.com/" docker-compose -f deploy/compose/docker-compose.yml down
	PREFIX="airphone-docker-local.artifactory-espoo1.int.net.nokia.com/" docker-compose -f deploy/compose/docker-compose.yml rm -f
	docker rmi airphone-docker-local.artifactory-espoo1.int.net.nokia.com/ctf_oran_radio:v0.1
	docker rmi airphone-docker-local.artifactory-espoo1.int.net.nokia.com/cli_ctf_oran:v0.1
	docker rmi airphone-docker-local.artifactory-espoo1.int.net.nokia.com/cli_ctf:v0.1
	docker rmi airphone-docker-local.artifactory-espoo1.int.net.nokia.com/ctf_netconf_oran:v0.1
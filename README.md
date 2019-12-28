# dst_dedicated_base

This repo is a bare-bones Don't Starve Together Dedicated server based on the [Quick Setup guide](https://forums.kleientertainment.com/forums/forum/83-dont-starve-together-dedicated-server-discussion/) in the Klei forums.

A dockerfile is provided for a base image

This assumes defaults:
* Server name is MyDediServer
* Ports used: 10889, 27018, 27019, 8768, 8769
* Everything is within the $HOME folder of the user

## Pre-requisites
* Docker is installed
* Have your cluster token ready

## Using this image
* Update Server name:
  1. In `MyDediServer/cluster.ini`, update the `cluster_name` value to desired server name
  2. Change folder name `MyDediServer` to the desired server name
  3. Change `cluster_name` in `run_dedicated_servers.sh`
* Add cluster token to the file `.klei/MyDediServer/cluster_token.txt`
* Build the docker image: `docker build -t dstserver .`
* Run the docker image: `docker run -d -p 10889:10889 dstserver`

That should be enough for a basic, public server

## Official Documentation:

* [Dedicated Server - Linux Quick Setup](https://forums.kleientertainment.com/forums/topic/64441-dedicated-server-quick-setup-guide-linux/)
* [Understanding Shards and Migration Portals](https://forums.kleientertainment.com/forums/topic/59174-understanding-shards-and-migration-portals/)
* [Dedicated Server - Settings Guide](https://forums.kleientertainment.com/forums/topic/64552-dedicated-server-settings-guide/)

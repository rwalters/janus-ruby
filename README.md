# Janus

A client/server experiment in ruby, using [Grape
API](https://github.com/ruby-grape/grape#basic-usage) and
[Her](https://github.com/remiprev/her)

## Docker

Everything should be brought up by `docker-compose up -d`
You can monitor the containers with `docker-compose ps`
And tail the logs with `docker-compose logs -f <container>`

## Server

There is a docker container, imaginatively named `server`, that serves up a
Grape API endpoint at localhost:3002/api/statuses/public_timeline

To tail the logs, you can use `docker-compose logs -f server`

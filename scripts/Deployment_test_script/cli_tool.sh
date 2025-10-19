#!/bin/bash

show_help() {
	echo "Usage: $0 --name <NAME> --env <ENV>"
	echo "Example: $0 --name harish --env dev" 
}

NAME=""
ENV=""

while [[ "$#" -gt 0 ]]; do
	case $1 in
	--name) NAME="$2"; shift;;
	--env) ENV="$2"; shift;;
	--help) show_help; exit 0;;
	*) echo "Unkown option: $1"; show_help; exit 1 ;;
	esac
	shift
done

 echo "Deploying app for $NAME in $ENV environment..."

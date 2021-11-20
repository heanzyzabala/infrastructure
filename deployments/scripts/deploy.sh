#!/bin/bash

usage () {
  echo "Deploys an app to a specified env:"
  echo
  echo "Usage:"
  echo "  deploy.sh --app|-a <app-name> [--help|-h] [--env|-e <dev>] [-t|--tag <tag>]"
  echo
  echo "Optional Args:"
  echo "  -e, --env          Defaults to 'dev'"
  echo "  -t, --tag          Defaults to the latest docker image"
  echo
  echo "Examples:"
  echo "  deploy.sh -a example-app -e dev -t 1.0.0"
  echo  
}

error () {
  echo "ERROR: $1"
  exit 1
}

print () {
  echo "INFO: $1"
}

SCRIPT_PATH="$(dirname $(dirname $0))"
DEPLOY_ENV=
APP_NAME=
TAG=

while true; do
  case "$1" in 
    -e|--env)
      DEPLOY_ENV="$2"
      shift
      ;;
    -a|--app)
      if [ -z "$2" ]; then
        error "Value for --app is required."
      fi
      APP_NAME="$2" 
      shift
      ;;
    -t|--tag)
      TAG="$2" 
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      break
      ;;
  esac
done

if [ -z "${APP_NAME}" ]; then
  error "Value for --app is required."
fi

if [ -z "${DEPLOY_ENV}" ]; then
  DEPLOY_ENV="dev"
  print "Default value for --env set to 'dev'."
fi

if [ -z "${TAG}" ]; then
  TAG="latest"
  print "Default value for --tag set to 'latest'."
fi

if [ ! -d "deployments/apps/${APP_NAME}" ]; then
  error "'${APP_NAME}' does not exist in deployment/apps directory."
fi


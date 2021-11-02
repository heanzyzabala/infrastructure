#!/bin/bash

usage () {
  echo "Deploys an app to a specified env:"
  echo
  echo "Usage:"
  echo "  deploy.sh --app|-a <app-name> [--help|-h] [--env|-e <dev>]"
  echo
  echo "Optional Args:"
  echo "  -e, --env          Defaults to 'dev'"
  echo
  echo "Examples:"
  echo "  deploy.sh -a example-app -e dev"
  echo  
}

error () {
  echo "ERROR: $1"
  exit 1
}

print () {
  echo "INFO: $1"
  exit 1
}

DEPLOY_ENV=
APP_NAME=

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
  print "Default value for --env set to 'dev'"
fi 

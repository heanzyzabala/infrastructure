#!/bin/bash

usage () {
  echo "Deploys an app to a cluster:"
  echo
  echo "Usage:"
  echo "  deploy.sh --app|-a <app-name> [--help|-h] [--namespace|-n <dev>]"
  echo
  echo "Optional Args:"
  echo "  -n, --namespace          Defaults to 'dev'"
  echo
  echo "Examples:"
  echo "  deploy.sh -a example-app -n dev"
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

NAMESPACE=
APP_NAME=

while true; do
  case "$1" in 
    -n|--namespace)
      NAMESPACE="$2"
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

if [ -z "${NAMESPACE}" ]; then
  NAMESPACE="dev"
  print "Default value for --namespace set to 'dev'"
fi 

echo "namespace: $NAMESPACE"
echo "app_name: $APP_NAME"
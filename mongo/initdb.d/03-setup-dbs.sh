#!/bin/bash

set -e

if [ "$MONGO_NON_ROOT_USERNAME" ] && [ "$MONGO_NON_ROOT_PASSWORD" ]; then
			/usr/bin/mongoimport --authenticationDatabase admin -d configuration -c actions \
					-u "$MONGO_NON_ROOT_USERNAME" -p "$MONGO_NON_ROOT_PASSWORD" \
					--drop --jsonArray --file /docker-entrypoint-initdb.d/actions.json
else
  echo "NO USERNAME"
fi

echo "======================================================"
echo "Prepared databases"
echo "======================================================"

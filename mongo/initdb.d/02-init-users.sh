#!/bin/bash

set -e

# a default non-root role
MONGO_NON_ROOT_ROLE="${MONGO_NON_ROOT_ROLE:-readWrite}"

if [ "$MONGO_INITDB_ROOT_USERNAME" ] && [ "$MONGO_INITDB_ROOT_PASSWORD" ]; then
			rootAuthDatabase='admin'
			"${mongo[@]}" "$rootAuthDatabase" <<-EOJS
						db.createUser({
									user: $(_js_escape "$MONGO_NON_ROOT_USERNAME"),
									pwd: $(_js_escape "$MONGO_NON_ROOT_PASSWORD"),
									roles: [ { role: "root", db: $(_js_escape "$rootAuthDatabase") } ]
						})
			EOJS
else
  echo "NO USERNAME"
fi

echo "======================================================"
echo "created $MONGO_NON_ROOT_USERNAME in database $MONGO_INITDB_DATABASE"
echo "======================================================"

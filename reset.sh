#!/bin/bash

echo "reset local dbs..."
git checkout master
git reset --hard
git clean -f

./init_update.sh
./device-class-db/reset.sh
./unit-template-db/reset.sh

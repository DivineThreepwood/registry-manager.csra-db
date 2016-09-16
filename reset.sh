#!/bin/bash

echo "reset local dbs..."
git reset --hard
git clean -f

./init_update.sh
./device-class-db/reset.sh
./unit-template-db/reset.sh
./app-class-db/reset.sh
./agent-class-db/reset.sh

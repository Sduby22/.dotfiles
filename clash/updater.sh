#!/bin/bash

wget "`cat ./subscription_link`" -O - | sed -e "s/^port:/mixed-port:/g" > ./config.yaml

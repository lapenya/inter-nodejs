#!/bin/bash

if [ "$NODE_ENV" == "production" ]; then
  coffee inter.coffee
else
  supervisor inter.coffee
fi

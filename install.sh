#!/bin/bash

git submodule foreach 'if [ "$name" != "Joi" ]; then npm ci; else echo "Skipping $name"; fi'

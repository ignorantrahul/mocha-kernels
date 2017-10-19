#!/bin/bash

# simple bash script to env setup fot executing kernel build

sudo apt-get update
sudo apt-get install -y libncurses-dev   bc  ccache  zip
sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*

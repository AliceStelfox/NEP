#!/bin/bash

# Create directories if they don't exist
mkdir -p IOS
mkdir -p Android

# Move iOS model files (.usdz) into IOS/
mv *.usdc IOS/ 2>/dev/null

# Move Android model files (.glb) into Android/
mv *.glb Android/ 2>/dev/null

# Create models.json and README.md if they don't exist
touch models.json
touch README.md

echo "Directory structure set up!"
#!/bin/bash

# Output file
OUTPUT="models.json"

# Start the JSON array
echo "[" > "$OUTPUT"

# Keep track of entry count to handle commas
FIRST_ENTRY=true

# Function to add a model entry
add_model() {
  local name="$1"
  local platform="$2"
  local path="$3"
  if [ "$FIRST_ENTRY" = true ]; then
    FIRST_ENTRY=false
  else
    echo "," >> "$OUTPUT"
  fi
  echo "  {\"name\": \"${name}\", \"platform\": \"${platform}\", \"path\": \"${path}\"}" >> "$OUTPUT"
}

# Scan IOS directory for .usdz files
for file in IOS/*.usdc; do
  [ -e "$file" ] || continue
  fname=$(basename "$file")
  add_model "${fname%.usdc}" "iOS" "$file"
done

# Scan Android directory for .glb files
for file in Android/*.glb; do
  [ -e "$file" ] || continue
  fname=$(basename "$file")
  add_model "${fname%.glb}" "Android" "$file"
done

# End the JSON array
echo "]" >> "$OUTPUT"

echo "models.json has been generated!"
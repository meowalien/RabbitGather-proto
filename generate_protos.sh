#!/bin/bash

PROTO_DIR="./source"  # This is your root directory containing .proto files.
GO_OUTPUT_DIR="./go"    # This is where you want your generated files to reside.

# Iterate over each .proto file in the directory.
find $PROTO_DIR -name "*.proto" | while read -r proto_file; do
  # Extract the directory path from the full file path.
  dir=$(dirname "$proto_file")
  # Use protoc to generate the files, maintaining the directory structure.
  protoc -I="$PROTO_DIR" --go_out="$GO_OUTPUT_DIR" --go_opt=paths=source_relative --go-grpc_out="$GO_OUTPUT_DIR" --go-grpc_opt=paths=source_relative "$proto_file"
done

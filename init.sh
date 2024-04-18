#!/bin/sh

# Create and update package.json
npm init -y
npm pkg set type=module
npm pkg set main=dist/index.js

# Install TypeScript dependencies for Node.js
# Allowed major versions: 10, 12, 14, 16, 17, 18, 19, 20, 21
# See full list at https://github.com/tsconfig/bases?tab=readme-ov-file#table-of-tsconfigs
node_major_version=18
npm i -D @tsconfig/node$node_major_version
npm i -D @types/node@^$node_major_version
npm i -D typescript

# Create tsconfig.json
cat > tsconfig.json <<EOF
{
  "extends": "@tsconfig/node${node_major_version}/tsconfig.json",
  "compilerOptions": {
    "outDir": "dist",
    "rootDir": "src"
  }
}
EOF

# server-compiler-code
Server Compiler Code

Setup foundry
```sh
. bash/foundry.sh
```

Setup setup format
```sh
npm install
```

Build
```sh
go build main.go
```

Run with build file
```sh
./server-compiler-code
```

Dev
```sh
go run main.go
```

## Run Execute-code

Test *TRUE*
```sh
curl -X 'POST' \
  'http://localhost:8080/api/v1/execute-code' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "code": "// SPDX-License-Identifier: MIT\npragma solidity ^0.8.0;\n\ncontract HelloWorld {\n    string public greet = \"Hello World\";\n}",
  "code_id": "sol-001",
  "uuid": "user1"
}'
```

Test *FALSE*
```sh
curl -X 'POST' \
  'http://localhost:8080/api/v1/execute-code' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "code": "// SPDX-License-Identifier: MIT\npragma solidity ^0.8.0;\n\ncontract HelloWorld {\n    string public greet = \"Hello World False\";\n}",
  "code_id": "sol-001",
  "uuid": "user1"
}'
```

Format *TRUE*
```sh
curl -X 'POST' \
  'http://localhost:8080/api/v1/format-code' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "code": "// SPDX-License-Identifier: MIT\npragma solidity ^0.8.0;\n\ncontract HelloWorld \n{\n    string public greet = \"Hello World\";\n}",
  "code_id": "sol-001",
  "uuid": "user1"
}'
```

Format *FALSE*
```sh
curl -X 'POST' \
  'http://localhost:8080/api/v1/format-code' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "code": "// SPDX-License-Identifier: MIT\npragma solidity ^0.8.0;\n\ncontract HelloWorld \n{\n    string public greet = \"Hello \nWorld\";\n}",
  "code_id": "sol-001",
  "uuid": "user1"
}'
```

Compiler *TRUE*
```sh
curl -X 'POST' \
  'http://localhost:8080/api/v1/compiler-code' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "code": "// SPDX-License-Identifier: MIT\npragma solidity ^0.8.0;\n\ncontract HelloWorld \n{\n    string public greet = \"Hello World\";\n}",
  "code_id": "sol-001",
  "uuid": "user1"
}'
```

Compiler *FALSE*
```sh
curl -X 'POST' \
  'http://localhost:8080/api/v1/compiler-code' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "code": "// SPDX-License-Identifier: MIT\npragma solidity ^0.8.0;\n\ncontract HelloWorld \n{\n    string public greet = \"Hello \nWorld\";\n}",
  "code_id": "sol-001",
  "uuid": "user1"
}'
```

## Swagger

### View Swagger UI

> http://localhost:8080/swagger/index.html

### Build Swagger

```sh
. bash/swag.sh
```
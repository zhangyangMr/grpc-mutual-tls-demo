openssl genrsa -passout pass:111111 -des3 -out ca.key 4096
openssl req -passin pass:111111 -new -x509 -days 365 -key ca.key -out ca.crt -subj "/CN=hello.world.com"
openssl genrsa -passout pass:111111 -des3 -out server.key 4096
openssl req -passin pass:111111 -new -key server.key -out server.csr -subj "/CN=hello.world.com"
openssl x509 -req -passin pass:111111 -days 365 -in server.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out server.crt
openssl rsa -passin pass:111111 -in server.key -out server.key
openssl genrsa -passout pass:111111 -des3 -out client.key 4096
openssl req -passin pass:111111 -new -key client.key -out client.csr -subj "/CN=hello.world.com"
openssl x509 -passin pass:111111 -req -days 365 -in client.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out client.crt
openssl rsa -passin pass:111111 -in client.key -out client.key
openssl pkcs8 -topk8 -nocrypt -in client.key -out client.pem
openssl pkcs8 -topk8 -nocrypt -in server.key -out server.pem

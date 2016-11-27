# OCP-NGINX-ClientCerts
This is to Demo the client certs functionality in OCP
#nginx version: nginx/1.11.5

// Making the Root CA

$ openssl req -x509 -newkey rsa:2048 -nodes -keyout ca.key -sha256 -days 1024 -out ca.crt -subj "/C=US/ST=Texas/L=Austin/O=Global Sec/OU=IT/CN=rootca"





// Making the the server cert and key
$CN=clisec
$echo $CN
$ openssl req -newkey rsa:2048 -keyout $CN.rhel-cdk.10.1.2.2.xip.io.key -out $CN.rhel-cdk.10.1.2.2.xip.io.csr -nodes -subj "/C=US/ST=Texas/L=Austin/O=Global Security/OU=IT Department/CN=$CN.rhel-cdk.10.1.2.2.xip.io"
openssl x509 -req -in $CN.rhel-cdk.10.1.2.2.xip.io.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out $CN.rhel-cdk.10.1.2.2.xip.io.crt -days 365 -sha256




//Making the client key/certs and then finally p12 file

$ openssl req -newkey rsa:2048 -keyout ronsengupta.key -out ronsengupta.csr -nodes -subj "/C=US/ST=Texas/L=Austin/O=Global Security/OU=IT Department/CN=ronsengupta"

$ openssl x509 -req -in ronsengupta.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out ronsengupta.crt -days 365 -sha256

$ openssl pkcs12 -export -clcerts -in ronsengupta.crt -inkey ronsengupta.key -out ronsengupta.p12

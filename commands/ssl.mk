SSL_CERT_NAME=localhost
SSL_CERT_KEY=$(SSL_CERT_NAME).key
SSL_CERT_CSR=$(SSL_CERT_NAME).csr
SSL_CERT_CRT=$(SSL_CERT_NAME).crt
SSL_CERT_DAYS=3650 # 10 years
SSL_CERT_SUBJECT=/C=BR/ST=SP/L=SP/O=Development/CN=$(SSL_CERT_NAME)

# Command to create a self-signed SSL certificate
create-ssl:
	openssl genrsa -out $(SSL_CERT_KEY) 2048
	openssl req -new -key $(SSL_CERT_KEY) -out $(SSL_CERT_CSR) -subj "$(SSL_CERT_SUBJECT)"
	openssl x509 -req -days $(SSL_CERT_DAYS) -in $(SSL_CERT_CSR) -signkey $(SSL_CERT_KEY) -out $(SSL_CERT_CRT)
	rm -f $(SSL_CERT_CSR)
	make move-ssl

# Command to move the SSL certificate and key to the Nginx directory
move-ssl:
	mv $(SSL_CERT_KEY) ./config/server/nginx/certs/
	mv $(SSL_CERT_CRT) ./config/server/nginx/certs/

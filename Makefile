.PHONY: _pwd_prompt decrypt_config encrypt_config build deploy buildDeploy

CONF_FILE=environment.sh

_pwd_prompt:
	@echo "Knotis WiFi for the password"


${CONF_FILE}: decrypt_config
include ${CONF_FILE}

# decrypting
decrypt_config: _pwd_prompt
	openssl enc -aes-256-cbc -md sha256 -d -in ${CONF_FILE}.aes -out ${CONF_FILE}
	chmod 600 ${CONF_FILE}

# encrypting/updating
encrypt_config: _pwd_prompt
	openssl enc -aes-256-cbc -md sha256 -salt -e -in ${CONF_FILE} -out ${CONF_FILE}.aes


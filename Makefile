SERVICE = letsencrypt
REGGAE_PATH = /usr/local/share/reggae

post_setup_ansible:
	@echo "letsencrypt_domain: ${FQDN}" >>ansible/group_vars/all

.include <${REGGAE_PATH}/mk/service.mk>

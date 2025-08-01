logs-socks4:
	podman logs -f socks4

logs-socks5:
	podman logs -f socks5

logs-https-proxy:
	podman logs -f https-proxy

logs-nginx:
	podman logs -f nginx

logs-nginx-access:
	tail -f -n +1 deployment/data/nginx/logs/access.log

logs-nginx-error:
	tail -f -n +1 deployment/data/nginx/logs/error.log

logs-mongo:
	podman logs -f mongo

logs-postgres:
	podman logs -f postgres

logs-timers:
	podman logs -f timers_app

logs-skillnotes:
	podman logs -f skillnotes_app

logs-fail2ban:
	tail -f -n +1 /var/log/fail2ban.log

logs-auth:
	journalctl -u ssh -n 10000 -f
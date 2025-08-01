stop-containers:
	podman stop -a

stop-socks4:
	- podman stop socks4
	- podman rm socks4

stop-socks5:
	- podman stop socks5
	- podman rm socks5

stop-https-proxy:
	- podman stop https-proxy
	- podman rm https-proxy

stop-nginx:
	- podman stop nginx
	- podman rm nginx

stop-db:
	- $(MAKE) stop-mongo
	- $(MAKE) stop-postgres

stop-mongo:
	- podman stop mongo
	- podman rm mongo

stop-postgres:
	- podman stop postgres
	- podman rm postgres

stop-demo:
	$(MAKE) stop-timers
	$(MAKE) stop-skillnotes

stop-timers:
	cd ./demo/demo-timers
	- make stop

stop-skillnotes:
	cd ./demo/demo-skillnotes
	- make stop

stop-fail2ban:
	systemctl disable fail2ban
	systemctl stop fail2ban
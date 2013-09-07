all: build install

build:
	go build gowwwredirect.go

install:
	cp gowwwredirect /usr/local/sbin/
	chmod 750 /usr/local/sbin/gowwwredirect
	chown root.root /usr/local/sbin/gowwwredirect
	cp gowwwredirect.conf /etc/init/
	ln -s /lib/init/upstart-job /etc/init.d/gowwwredirect
	/usr/sbin/update-rc.d gowwwredirect defaults

uninstall:
	rm -rf /usr/local/sbin/gowwwredirect
	/usr/sbin/update-rc.d -f gowwwredirect remove
	rm /etc/init/gowwwredirect.conf
	rm /etc/init.d/gowwwredirect

clean:
	rm -rf gowwwredirect
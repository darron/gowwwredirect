all: build install

build:
	go build gowwwredirect.go

install:
	mkdir -p $(DESTDIR)/usr/local/sbin/
	cp gowwwredirect $(DESTDIR)/usr/local/sbin/
	chmod 750 $(DESTDIR)/usr/local/sbin/gowwwredirect
	chown root.root $(DESTDIR)/usr/local/sbin/gowwwredirect
	mkdir -p $(DESTDIR)/etc/init
	cp gowwwredirect.conf $(DESTDIR)/etc/init/
	mkdir -p $(DESTDIR)/etc/init.d
	ln -s $(DESTDIR)/lib/init/upstart-job $(DESTDIR)/etc/init.d/gowwwredirect
	/usr/sbin/update-rc.d gowwwredirect defaults

uninstall:
	rm -rf $(DESTDIR)/usr/local/sbin/gowwwredirect
	/usr/sbin/update-rc.d -f gowwwredirect remove
	rm $(DESTDIR)/etc/init/gowwwredirect.conf
	rm $(DESTDIR)/etc/init.d/gowwwredirect

clean:
	rm -rf gowwwredirect
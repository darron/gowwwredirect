gowwwredirect
=============

Simple Go app to automatically redirect people to a www version of a domain.

```
go get github.com/jcelliott/lumber
make build
make install
service gowwwredirect start
service gowwwredirect stop
make uninstall
```

To build Ubuntu deb:
=========
```
gem install fpm
mkdir /tmp/installdir
make install DESTDIR=/tmp/installdir
fpm -s dir -t deb -n gowwwredirect -v 0.1.0 -C /tmp/installdir   -p gowwwredirect-VERSION_ARCH.deb   etc/init etc/init.d usr/local/sbin
```
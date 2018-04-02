.PHONY: all install build clean distclean google-mail google-calendar

all: google-mail google-calendar

install: all
	ls -1d build/*/*.app | xargs -I FILE cp -R FILE /Applications/

build:
	mkdir -p build

node_modules:
	yarn install

clean:
	rm -rf build

distclean: clean
	rm -rf node_modules

PRE := build node_modules

google-mail: $(PRE)
	yarn exec nativefier --counter --internal-urls 'mail.google.com$$' "https://mail.google.com" build

google-calendar: $(PRE)
	yarn exec nativefier --counter --internal-urls 'calendar.google.com$$' "https://calendar.google.com" build

.PHONY: all install clean distclean gmail install-gmail google-calendar install-google-calendar

all: gmail google-calendar

install: install-gmail install-google-calendar

build:
	mkdir -p build

node_modules:
	yarn install

clean:
	rm -rf build

distclean: clean
	rm -rf node_modules

PRE := build node_modules

# Gmail - mail.google.com

gmail: $(PRE)
	yarn exec -- nativefier --name 'Gmail' --counter --internal-urls 'mail.google.com$$' "https://mail.google.com" build

install-gmail: gmail
	ditto build/Gmail-darwin-x64/Gmail.app /Applications/Gmail.app

# Google Calendar - calendar.google.com

google-calendar: $(PRE)
	yarn exec -- nativefier --name 'Google Calendar' --counter --internal-urls 'calendar.google.com$$' "https://calendar.google.com" build

install-google-calendar: google-calendar
	ditto build/Google\ Calendar-darwin-x64/Google\ Calendar.app /Applications/Google\ Calendar.app

# nativefier-apps

Builds apps using nativefier:

* GIPHY
* Gmail
* Google Calendar
* Puppet Tickets

## Dependencies

```bash
brew install node
brew install yarn
brew install grunt-cli
```

## Usage

```bash
yarn install
(cd node_modules/nativefier; yarn install; (cd app; yarn install); yarn run build)
(cd node_modules/.bin; ln -s ../nativefier/lib/cli.js nativefier)
grunt build && grunt install
```

## Acknowledgements

* https://github.com/jiahaog/nativefier

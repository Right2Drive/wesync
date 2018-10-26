[![Build Status](https://travis-ci.org/WeSyncVideo/wesync-web.svg?branch=master)](https://travis-ci.org/WeSyncVideo/wesync-web)
# WeSync Web Client

The WeSync team is dedicated to bringing you closer to your loved ones, even across great distances.
Using a peer-to-peer architecture to safeguard your privacy, WeSync allows you to watch video's together in near-perfect sync, all through popular web browsers.

## Roadmap

WeSync is currently under active development

- [ ] web client skeleton
- [ ] signal server
- [ ] engine
- [ ] integration
- [ ] advanced features

## Screenshots

None available yet, sorry!

## Supported Browsers

* Brave 0.55+
* Chrome 65+

Although these are the only two browsers we officially support, WeSync web may well work in other browsers.
We **strongly recommend using Brave** as the team behind it is doing great things such as:
- Blocks ads & trackers by default
- Loads pages faster than Chrome (significantly faster)
- Saves you data
- Soon to pay it's users who opt in to view ads

You can take a look and/or download it [here](https://brave.com/)

## Donations

We do not currently have anything setup for donations, but will update this if that changes

## About the project

WeSync actually started out as @Parasrah's personal project [Ease](https://github.com/parasrah/ease) as a desktop application.
Together the team believes we can do better a second time around, and are looking to create a 100% web solution

## Development

We welcome contributions, the process may be a little informal at this point but please feel free to raise an issue for a feature you'd like to see or submit a PR!

### Requirements

* NodeJS 8.9.0+
* npm 6.4.1+

### Building

- `npm start` to run a development server on `localhost:8080`
- `npm run build` to generate an optimized bundle file

## Testing

- `npm run lint` to run linters against both the `.js` and `.elm` source files
- `npm test` will currently run the elm tests

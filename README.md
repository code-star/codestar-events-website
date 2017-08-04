# elm-codestar-website
Elm rebuild of codestar.nl

https://guide.elm-lang.org/install.html

## Generate

* nvm use 8.0.0
* `npm install -g elm`
* `elm package install`

## Run

* nvm use 8.0.0
* installation: `npm install`
* run `npm run start`
* go to http://localhost:8080

	
## Formatting

Please run [elm-format](https://github.com/avh4/elm-format) on all your code before pushing to the repo for [consistency](https://github.com/avh4/elm-format#elm-format).

### Installation and run once

* `npm install -g elm-format@exp`
* commit your code before formatting?
* `elm-format app/src/`

### Formatting in editor

Set up according to editor specific guide on https://github.com/avh4/elm-format

If it works well, it can be added to `npm run start`, e.g. with `"start": "npm run format && concurrently --kill-others \"http-server docs\" \"npm run watch\""`



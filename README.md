# elm-codestar-website
Elm rebuild of codestar.nl

https://guide.elm-lang.org/install.html

## Generate

* nvm use 8.0.0
* `npm install -g elm`
* `elm package install`

## Run

* nvm use 8.0.0
* installation: `elm package install`
* run: `elm reactor` (or `elm reactor -p 8100`)
* build module for production: `elm make app/Main.elm --output=docs/main.js`
* build HTML for production: `elm make app/Main.elm --output=docs/test.html`
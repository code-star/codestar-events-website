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
* in terminal 1
	* in root dir run `npm run watch`
* in terminal 2
	* in root dir run `http-server docs`
* go to http://localhost:8080

	
## Formatting

Please run [elm-format](https://github.com/avh4/elm-format) on all your code before pushing to the repo for [consistency](https://github.com/avh4/elm-format#elm-format).

* `npm install -g elm-format@exp`
* commit your code before formatting?
* `elm-format app/src/`

# elm-codestar-website
Elm rebuild of codestar.nl

https://guide.elm-lang.org/install.html


## Run

* nvm use 8.2.x
* installation: `npm install`
* set up symlink for debugging: `ln -s /docs/img /debug/img` (use absolute paths in MacOS)
* run `npm run start`
* go to http://localhost:8000/debug/index.html

npm-watch does not work correctly on MacOS: https://github.com/M-Zuber/npm-watch/issues/35

## Develop
* run `npm run watch` to start Gulp with live reload
* run `elm reactor` to start the development server
* go to [http://localhost:8000/debug/index.html](http://localhost:8000/debug/index.html)   


## Build

* nvm use 8.0.0
* run `npm run build`
* Result is in 'docs' dir. You can run `http-server` in it to test and when pushing the repo the files will be hosted on gh-pages from de docs dir.

	
## Formatting

Please run [elm-format](https://github.com/avh4/elm-format) on all your code before pushing to the repo for [consistency](https://github.com/avh4/elm-format#elm-format).

### Installation and run once

* `npm install -g elm-format@exp`
* commit your code before formatting?
* `elm-format app/src/`

### Formatting in editor

Set up according to editor specific guide on https://github.com/avh4/elm-format

If it works well, it can be added to `npm run start`, e.g. with `"start": "npm run format && concurrently --kill-others \"http-server docs\" \"npm run watch\""`

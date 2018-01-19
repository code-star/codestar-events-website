# elm-codestar-website

Elm rebuild of codestar.nl


## Develop

* nvm use
* installation: `npm install`
* set up symlink for debugging: `ln -s /docs/img /debug/img` (use absolute paths in MacOS)
* run `npm start`
* go to http://localhost:8081

npm-watch does not work correctly on MacOS: https://github.com/M-Zuber/npm-watch/issues/35


## Build

* nvm use
* Run `npm run build`
* This is also run by CI
* Tests if formatted and runs tests from tests/ dir
* Result is in 'docs' dir. You can run `http-server` in it to test and when pushing the repo the files will 
be hosted on gh-pages from de docs dir.


## Testing

Copy all the dependencies from elm-package.json into tests/elm-package.json. These dependencies need to stay 
in sync, so make sure whenever you change your dependencies in your current elm-package.json, you make the 
same change to tests/elm-package.json.

Run `npm test`: will validate with elm-format and run the unit tests with elm-test.


## Formatting

Please run [elm-format](https://github.com/avh4/elm-format) on all your code before pushing to the repo 
for [consistency](https://github.com/avh4/elm-format#elm-format).

Formatting is executed once on `npm start` or manually with `npm run format`.

### Formatting in editor

Set up according to editor specific guide on https://github.com/avh4/elm-format


## Notes

### Elm Guide

https://guide.elm-lang.org/install.html

### Generating key

`openssl base64 -in key -out encodedKey`

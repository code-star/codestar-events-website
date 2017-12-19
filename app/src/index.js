// Bootstrapping Elm
'use strict';

// require('ace-css/css/ace.css');
// require('font-awesome/css/font-awesome.css');

// Require index.html so it gets copied to dist
import './index.html';

import './less/style.less';

const Elm = require('./elm/Main.elm');
const mountNode = document.getElementById('main');

// .embed() can take an optional second argument. This would be an object describing the data we need to start a program, i.e. a userID or some token
//const app =
Elm.Main.embed(mountNode);
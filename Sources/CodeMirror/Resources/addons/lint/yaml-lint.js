'use strict';(function(a){"object"==typeof exports&&"object"==typeof module?a(require("../../lib/codemirror")):"function"==typeof define&&define.amd?define(["../../lib/codemirror"],a):a(CodeMirror)})(function(a){a.registerHelper("lint","yaml",function(b){var c=[];if(!window.jsyaml)return window.console&&window.console.error("Error: window.jsyaml not defined, CodeMirror YAML linting cannot run."),c;try{jsyaml.loadAll(b)}catch(d){b=(b=d.mark)?a.Pos(b.line,b.column):a.Pos(0,0),c.push({from:b,to:b,message:d.message})}return c})});

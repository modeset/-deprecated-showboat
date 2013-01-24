#= require underscore
#= require head.min
#= require reveal
#= require_tree ./plugins

Reveal.initialize
  history: true
  center: false
  rollingLinks: false
  loop: true
  transition: "default" # default/cube/page/concave/zoom/linear/fade/none

  # Optional libraries used to extend on reveal.js
  dependencies: [
    src: "assets/classList.js"
    condition: ->
      !document.body.classList
  ,
    src: "assets/zoom.js"
    async: true
    condition: ->
      !!document.body.classList
  ,
    src: "assets/notes.js"
    async: true
    condition: ->
      !!document.body.classList
  ,
    src: 'assets/highlight.js'
    async: true
    callback: ->
      hljs.initHighlightingOnLoad()
  ]


Reveal.addEventListener 'ready', (e) ->
  plugins = [SlideHeading, PageTitle, ResponsiveFrame, HelpModal]
  new plugin Reveal for plugin in plugins


#= require underscore
#= require head.min
#= require reveal
#= require ./slide_heading
#= require ./page_title

Reveal.initialize
  controls: true
  progress: true
  history: true
  center: false
  rollingLinks: false
  loop: true
  theme: Reveal.getQueryHash().theme
  transition: Reveal.getQueryHash().transition or "default" # default/cube/page/concave/zoom/linear/none

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
  ]


Reveal.addEventListener 'ready', (e) ->
  slide_heading = new SlideHeading Reveal
  page_title = new PageTitle Reveal


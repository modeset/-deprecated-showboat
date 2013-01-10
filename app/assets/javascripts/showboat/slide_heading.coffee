class window.SlideHeading

  constructor: (@reveal) ->
    @heading = document.querySelector '#main_heading'
    @addListeners()
    @render(currentSlide: _.last(document.querySelectorAll('.present')))


  addListeners: ->
    @reveal.addEventListener 'slidechanged', => @render arguments...


  render: (e) ->
    markup = e.currentSlide.getAttribute('data-heading') || ''
    method = if _.isEmpty(markup) then 'remove' else 'add'
    @heading.innerHTML = markup
    @heading.classList[method]('in')


class window.SlideHeading

  constructor: (@reveal) ->
    @heading = document.querySelector '#main_heading'
    @reveal.addEventListener 'slidechanged', => @render arguments...
    @render(currentSlide: _.last(document.querySelectorAll('.present')))


  render: (e) ->
    markup = e.currentSlide.getAttribute('data-heading') || ''
    method = if _.isEmpty(markup) then 'remove' else 'add'
    @heading.innerHTML = markup
    @heading.classList[method]('in')


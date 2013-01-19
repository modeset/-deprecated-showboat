class window.SlideHeading

  constructor: (@reveal) ->
    @header = document.querySelector '#main_heading'
    @heading = @header.querySelector 'h1'
    @reveal.addEventListener 'slidechanged', => @render arguments...
    @render(currentSlide: _.last(document.querySelectorAll('.present')))


  render: (e) ->
    slide = e.currentSlide
    markup = @title slide
    markup += @link slide
    method = if _.isEmpty(markup) then 'remove' else 'add'
    @heading.innerHTML = markup
    @header.classList[method]('in')


  title: (slide) ->
    slide.getAttribute('data-heading') || ''


  link: (slide) ->
    link = slide.getAttribute('data-link')
    return '' unless link
    src = slide.getAttribute('data-src') || "#"
    "<a href='#{src}' target='_blank'>#{link}</a>"


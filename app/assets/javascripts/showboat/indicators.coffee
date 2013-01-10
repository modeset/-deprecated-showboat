class window.Indication

  constructor: (@reveal) ->
    @initialize()
    @addListeners()
    @render(indexh: @reveal.getIndices().h)


  initialize: ->
    @total = document.querySelectorAll(".reveal .slides > section:not(.stack)").length + 1
    @indicators = @create()


  addListeners: ->
    @reveal.addEventListener 'slidechanged', => @render arguments...


  create: ->
    indication = document.createElement 'ul'
    markup = ''
    for index in [0..@total]
      markup += "<li><a href='#/#{index}'></a></li>"
    indication.classList.add('indicators')
    indication.innerHTML = markup
    document.querySelector('.reveal').appendChild(indication)
    indication.querySelectorAll('li')


  render: (e) ->
    for indicator in @indicators
      indicator.classList.remove('active')
    @indicators[e.indexh].classList.add('active')


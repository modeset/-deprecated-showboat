class window.PageTitle

  constructor: (@reveal, @prefix) ->
    @title = document.querySelector 'title'
    @prefix ?= @title.innerHTML
    @total = document.querySelectorAll(".reveal .slides > section:not(.stack)").length
    @reveal.addEventListener 'slidechanged', => @render arguments...
    @render(indexh: @reveal.getIndices().h)


  render: (e) ->
    @title.innerHTML = "#{@prefix}: #{e.indexh} of #{@total}"


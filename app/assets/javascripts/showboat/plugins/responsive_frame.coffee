class window.ResponsiveFrame
  constructor: (@reveal) ->
    @frames = document.querySelectorAll '.media-template > iframe'
    return unless @frames.length
    _.defer => @initialize()


  initialize: ->
    @sample_media = document.querySelector('.media-template > img') || @frames[0]
    @sample_parent = @sample_media.parentNode
    @setRatios()
    @addListeners()
    @resize()


  resize: (e) ->
    percent = @sample_media.offsetWidth / @sample_parent.offsetWidth
    for frame in @frames
      ratio = frame.getAttribute 'data-ratio'
      wv = Math.round(frame.parentNode.offsetWidth * percent)
      hv = Math.round(wv * ratio)
      frame.setAttribute 'width', wv
      frame.setAttribute 'height', hv


  addListeners: ->
    window.addEventListener 'resize', => @resize arguments..., false
    @reveal.addEventListener 'slidechanged', => @resize arguments...


  setRatios: ->
    for frame in @frames
      wv = frame.getAttribute('width') || frame.offsetWidth
      hv = frame.getAttribute('height') || frame.offsetHeight
      ratio = hv / wv
      frame.setAttribute 'data-ratio', ratio


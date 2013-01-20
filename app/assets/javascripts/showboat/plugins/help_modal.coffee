class window.HelpModal

  shortcuts: [
    {key: 'F'      , desc: 'Enters full screen mode'}
    {key: 'Esc'    , desc: 'Zoom to the overview screen'}
    {key: 'Return' , desc: 'Select slide from overview screen'}
    {key: 'Space'  , desc: 'Next slide or select slide from overview screen'}
    {key: '.'      , desc: 'Pause the presentation'   , key_alt: 'b'}
    {key: '&rarr;' , desc: 'Navigate right'           , key_alt: 'l'}
    {key: '&larr;' , desc: 'Navigate left'            , key_alt: 'h'}
    {key: '&uarr;' , desc: 'Navigate up'              , key_alt: 'k'}
    {key: '&darr;' , desc: 'Navigate down'            , key_alt: 'j'}
    {key: 'p'      , desc: 'Previous slide'           , key_alt: 'Page Up'}
    {key: 'n'      , desc: 'Next slide'               , key_alt: 'Page Down'}
    {key: 'home'   , desc: 'Jump to first slide'}
    {key: 'end'    , desc: 'Jump to last slide'}
    {key: '?'      , desc: 'Toggles the help modal'}
  ]

  constructor: (@reveal) ->
    @help = null
    @is_active = false
    document.addEventListener 'keydown', => @keyed arguments...


  keyed: (e) ->
    if e.shiftKey and e.keyCode is 191
      if @is_active then @remove() else @add()


  add: ->
    @is_active = true
    @render() unless @help
    document.body.appendChild @help


  remove: ->
    @is_active = false
    document.body.removeChild @help


  render: ->
    div = document.createElement 'div'
    div.className = 'help-modal'
    div.innerHTML = @markup()
    @help = document.body.appendChild div


  markup: ->
    html = """
           <p class="shortcut-title">Keyboard Shortcuts</p>
           #{@row shortcut for shortcut in @shortcuts}
           """
    html.replace /\,/g, ''


  row: (shortcut) ->
    """
    <p>
      <span>#{shortcut.desc}</span>
      <code>#{shortcut.key}</code>
      #{if shortcut.key_alt then ' <small>or</small> <code>' + shortcut.key_alt + '</code>' else ''}
    </p>
    """


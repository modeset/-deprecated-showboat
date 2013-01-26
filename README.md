# Showboat
Presentation application and master slide layouts for [Mode
Set](http://www.modeset.com/). Built on top of [reveal.js][reveal].


## Installation
Create a new rails app:

```
rails new my_presentation
```

Edit the `Gemfile` (it only needs 2 gems) 

```
gem 'rails'
gem 'showboat'
```


Get 'er going

```
bundle
rails g showboat:install
powder link
powder open
```

The generator will clean up a bunch of files and install showboat's
dummy app and required files.

Once the app is up and running, hit the `?` key to view all of the
shortcut key commands provided by [reveal.js][reveal].


## Creating the Deck
The markup for the deck lives in `app/views/showboat/index.html.haml`.
Edit this guy to build out your presentation. It's a basic Rails app
with [Haml][haml], [Redcarpet][carpet] and likely suspects. Use
`partials` if you want to break the presentation down into smaller
sections for editing.

The initial markup contains all of the available master slide templates
and styles that exist in showboat's dummy app. These should give you a
good idea what layouts are possible. But if you need it, there is also a
generator which can append stub markup into the `index.html.haml` file.
Run it with:

```
rails g showboat:slide template_name
```

Where `template_name` can be: `title`|`copy`|`list`|`fragment`|`media`|`end`

As far as markup structure is concerned, check out the docs over at
[reveal.js][reveal]. We haven't strayed to far from the base
application. Where applicable, `data` attributes are used for some
settings (background coloring, links, headers). This should be fairly
self explanatory from the example files.


## Customizing Behavior
In `app/assets/javascripts/application.coffee`, the install generator
added some initialization code for [reveal.js][reveal]. Feel free to
tweak these to your liking.

### Heads up! 

- Setting `center` to `true` is really going to screw shit up, so just
  don't do it.
- We aren't supporting all of [reveal's][reveal] transitions for sake of
  maintenance. 
- We added a couple of small plugins on top of the plugins found on [reveal's site][reveal].
- [Reveal][reveal] is not dependent on any external library (that means
  no jQuery), if you are adding anything, make sure you rock native
  JavaScript in any of your additions. 


## Customizing Styles
If you need to override or create separate styles, just add them to your
projects `app/assets/stylesheets` directory and import them after
showboat's import.

We've tuned the layouts to work against a number of media queries from
`2560px` down to `320px` screen sizes, hitting the main ones along the
way. The layout is responsive where it can be, but might need some fine
tuning based on the projector and/or device your presenting on.


## PDF Generation
We've tweaked [reveal's][reveal] print style sheet to work with the Mode
Set templates. These should be fairly good to go for generating a PDF.
Just hit print and open it in Preview.app to save as a PDF document.
Depending on the content of your slides, this might need a little
manual tweaking. Once that's done though it should be primed to throw it
up on [Speaker Deck](https://speakerdeck.com/).


## License
Licensed under the [MIT License](http://creativecommons.org/licenses/MIT/)

Copyright 2013 [Mode Set](https://github.com/modeset)

[Reveal][reveal] is also licensed under the [MIT License](https://github.com/hakimel/reveal.js/blob/master/LICENSE)


## Talk Nerdy To Me
![crest](https://secure.gravatar.com/avatar/aa8ea677b07f626479fd280049b0e19f?s=75)

## Todo
- web socket control
- make public and release the gem
- retina assets
- add optional per slide transition type
- charts


[reveal]: https://github.com/hakimel/reveal.js
[haml]: http://www.haml.info/
[carpet]: https://github.com/vmg/redcarpet


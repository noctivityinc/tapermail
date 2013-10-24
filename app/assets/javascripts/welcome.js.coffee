TPR.welcome = (->

  init: ->

    $('.dl_cta').click (ev) ->
      ev.preventDefault()
      $('#downloadBar').slideToggle(100)
      window.scrollTo(0,0)
      $('#mce-EMAIL').focus()

  index: ->
    $.localScroll
      duration: 300

)()



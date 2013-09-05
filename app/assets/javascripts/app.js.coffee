TPR.app = (->

  tour: ->
    $('.carousel').carousel
      interval: false

    $('.carousel').on 'slid.bs.carousel', ->
      $active = $(this).find('.active')
      console.log $active

      if $active.hasClass('first') 
        $('#controls .prev').hide()
      else
        $('#controls .prev').show()

      if $active.hasClass('last') 
        $('#controls .done').show()
        $('#controls .next').hide()
      else
        $('#controls .done').hide()
        $('#controls .next').show()

)()

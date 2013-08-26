spits = 0
maxFish = 50

TPR.welcome = (->

  index: ->
    $('header .navbar-brand').waypoint('sticky')

    $.localScroll
      duration: 300

)()


moveFish = ($aquarium, $leftSide, $fish, lWidth, lHeight) ->
  $logo = $('#logo')
  logoLeft = $logo.position().left
  logoTop = $logo.position().top
  logoBottom = $logo.height() + logoTop

  randomSpeed = if ($leftSide.find('.fish').length == 1) then 2000 else Math.floor((Math.random()*2000)+500);

  css = {top: -51, left: lWidth + 1}

  while css.top > (lHeight + 50) or css.top < -50 or css.left < -50 or css.left > (lWidth + 50)
    randomX = Math.floor((Math.random()*lWidth)-(lWidth / 2));
    randomY = Math.floor(Math.random() * lHeight) - (lHeight / 2);
    css.top = $fish.position().top + randomY
    css.left = $fish.position().left + randomX

  $fish.animate css, 
    duration: randomSpeed
    easing: 'linear'
    complete: -> 
      moveFish $aquarium, $leftSide, $fish, lWidth, lHeight
    step: ->
      pos = $fish.position()
      if pos.left >= logoLeft and pos.top > logoTop and pos.top < logoBottom
        $fish.remove()
        spits += 1

addFish = ($aquarium, $leftSide, lWidth, lHeight) ->
  startY = Math.floor((Math.random()*lHeight)+$aquarium.position().top);
  startX = -50

  $fish = $('<div/>', class: 'fish')
  $fish.css {top: startY, left: startX}
  $leftSide.append($fish)
  
  moveFish $aquarium, $leftSide, $fish, lWidth, lHeight

addSchool = ($aquarium, $leftSide, lWidth, lHeight) ->
  # always start with just one slow fish
  if $leftSide.find('.fish').length == 0
    numberOfFish = 1
    delay = 3000
  else
    numberOfFish = Math.floor((Math.random()*7)+1);
    delay = Math.floor((Math.random()*3000)+1000);

  if $leftSide.find('.fish').length < maxFish
    for x in [1..numberOfFish]
      addFish $aquarium, $leftSide, lWidth, lHeight

    window.setTimeout (-> addSchool($aquarium, $leftSide, lWidth, lHeight)), delay

addSpit = ($aquarium) ->
  return unless spits > 0
  spits =- 1

  $rightSide = $('#rightSide')
  $logo = $('#logo')
  xLine = $logo.position().top + ($logo.height() / 2) - 10

  $fish = $('<div/>', class: 'fish email')
  $fish.css {top: xLine, left: 125}
  $rightSide.append($fish)

  rightEdge = $rightSide.width() - ($fish.width() * 2)
  $fish.animate {left: 1000}, 
    duration: 15000
    easing: 'linear'
    step: ->
      if $fish.position().left >= rightEdge
        $fish.fadeOut '200', ->
          $fish.remove()

  showNav($rightSide)

showNav = ($rightSide) ->
  $nav = $rightSide.find('ul')
  if $nav.not(':visible')
    $nav.fadeIn 5000


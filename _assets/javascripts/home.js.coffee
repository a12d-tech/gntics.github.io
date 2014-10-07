$ ->

  $(window).ready ->
    verticalAlign()

  verticalAlign = ->
    windowHeight = $(window).height()
    pagesHeight = []
    pages = $('.page')
    pages.each (i,e) ->
      pagesHeight.push $(e).height()
    maxHeight = Math.max.apply(null, pagesHeight)
    if windowHeight > maxHeight
      $('.page').each (i,el) ->
        $('div#content').css('padding-top',0)
        $(el).css('height', windowHeight)

        pageTitle = $(el).find('.page-title')
        pageTitleHeight = pageTitle.outerHeight(true) if pageTitle?

        pageMain = $(el).find('.page-main')
        pageMainHeight = pageMain.outerHeight(true)

        pageTransition = $(el).find('.trnstn')
        pageTransitionHeight = pageTransition.outerHeight()

        pageMainPaddingTop = ((windowHeight - pageMainHeight) / 2)  - pageTitleHeight
        pageMain.css('padding-top', pageMainPaddingTop)

        pageTransitionPaddingTop = windowHeight - pageMain.outerHeight(true) - pageTitleHeight - pageTransitionHeight - 5
        pageTransition.css('padding-top', pageTransitionPaddingTop)

    return

  # Add animations on elements
  $("#logo").addClass "animated bounceInLeft"
  $("ul.menu-icons-container li").addClass "animated bounceInDown"

  $(".typing").typed
    strings: [
      "Hi^500 I'm Axle"
      "Hi I'm Alexandre, ^500 \n a software engineer"
      "I create ^500 web, mobile apps ^500 \n and other stuff"
      "Oh, ^200 by the way ^300 \n I'm available for hire."
    ]
    typeSpeed: 50
    callback: ->
      animateHome()
      return

  animateHome = ->
    # Add animations on elements
    $(".one .profile-pic").addClass "animated tada"
    return

  # Add animations on elements when scrolling
  $(window).scroll (event) ->
    # no animations for small screens
    if $(window).width() > 568
      handleAnimationWhenVisible "#motivationals .unit", "fadeInLeftRight"
      handleAnimationWhenVisible "#focus-points ul li", "fadeInLeftRight"
      handleAnimationWhenVisible "#technos .logo", "fadeInUp"
      handleAnimationWhenVisible "div.trnstn ul li.unit", "fadeInLeftRight"
    return

  handleAnimationWhenVisible = (selector, animation) ->
    $(selector).each (i, el) ->
      el = $(el)
      if el.visible(true)
        el.addClass "animated"
        if animation is "fadeInUp"
          el.addClass "fadeInUp"
        else if animation is "fadeInLeftRight"
          el.addClass "fadeInLeft"  if el.hasClass("left")
          el.addClass "fadeInRight"  if el.hasClass("right")
          el.addClass "bounceIn"  if el.hasClass("bnce")
      return

    return

  # transition behaviour
  findNextPage = (transitionPosition, allPagesPosition) ->
    nextIndexPagePosition = null
    $.each allPagesPosition, (index, value) ->
      if transitionPosition < value
        nextIndexPagePosition = index
        return false
      return

    allPagesPosition[nextIndexPagePosition]

  smoothScrollTo = (position) ->
    $("html, body").animate
      scrollTop: position# - 20
    ,
      duration: 750

    return

  $("div.icon").click (e) ->
    positionFromTop = []
    transitionPosition = $(this).position().top
    scrollPosition = null
    e.preventDefault()
    $(".page").each (index) ->
      positionFromTop.push $(this).position().top
      return

    scrollPosition = findNextPage(transitionPosition, positionFromTop)
    smoothScrollTo scrollPosition
    return

  return

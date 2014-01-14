$(function() {
  /* Add animations on elements */
  $('.one .intro').addClass('animated fadeInRight');

  /* Add animations on elements when scrolling */
  $(window).scroll(function(event) {
    // no animations for small screens
    if ($(window).width() > 568){

      handleRightLeftAnimation("#motivationals .unit");
      handleRightLeftAnimation("#focus-points ul li");

      $("#technos .logo").each(function(i, el) {
        var el = $(el);
        if (el.visible(true)) {
          el.addClass("animated fadeInUp"); 
        }
        else{
          if (el.hasClass("animated")) {
            el.removeClass("animated fadeInUp");
          }
        }
      });
    }
  });

  /* headroom plugin config */
  $("header").headroom({
   "tolerance": 5,
    "offset": 205,
    "classes": {
      "initial": "animated-header",
      "pinned": "slideDown",
      "unpinned": "slideUp"
    }
  });

  /* transition behaviour */
  $("div.icon").click(function(e){
    var positionFromTop = [];
    var transitionPosition = $(this).position().top;
    var scrollPosition = null;

    e.preventDefault();
    $(".page").each(function(index){
      positionFromTop.push($(this).position().top);
    });
    scrollPosition = findNextPage(transitionPosition, positionFromTop);
    smoothScrollTo(scrollPosition);
  });

  function findNextPage(transitionPosition, allPagesPosition){
    var nextIndexPagePosition = null;

    $.each(allPagesPosition, function(index,value){
      if (transitionPosition < value) {
        nextIndexPagePosition = index;
        return false;
      };
    });
    return allPagesPosition[nextIndexPagePosition];
  };

  function smoothScrollTo(position){
    $("html, body").animate(
      { scrollTop: position - 20 },
      { duration: 750 }
    );
  };

  /* animation util to handle fade in left/right */
  function handleRightLeftAnimation(selector){
    $(selector).each(function(i, el) {
      var el = $(el);
      if (el.visible(true)) {
        if (el.hasClass("left")) {
          el.addClass("animated fadeInLeft"); 
        }
        if (el.hasClass("right")) {
          el.addClass("animated fadeInRight"); 
        }
      }
      else{
        if (el.hasClass("animated")) {
          if (el.hasClass("fadeInLeft")) {
            el.removeClass("animated fadeInLeft"); 
          }
          if (el.hasClass("fadeInRight")) {
            el.removeClass("animated fadeInRight"); 
          } 
        }
      }
    });
  };
});
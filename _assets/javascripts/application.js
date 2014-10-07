//= require 'vendor/jquery-1.10.2.min'
//= require 'vendor/headroom/headroom.min'
//= require 'vendor/headroom/jQuery.headroom'
//= require 'vendor/visible/jquery.visible'
//= require 'vendor/typed/typed'
//= require resume

$("header").headroom({
  tolerance: 5,
  offset: 205,
  classes: {
    initial: "animated-header",
    pinned: "slideDown",
    unpinned: "slideUp"
  }
});

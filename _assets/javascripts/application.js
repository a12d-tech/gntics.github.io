//= require 'vendor/jquery-1.10.2.min'
//= require 'vendor/headroom/headroom.min'
//= require 'vendor/headroom/jQuery.headroom'
//= require 'vendor/visible/jquery.visible'
//= require 'vendor/typed/typed'
//= require 'vendor/magnific-popup/jquery.magnific-popup'
//= require resume

//= require 'angular/app'
//= require 'angular/vendor/ui-router'
//= require 'angular/vendor/ngStorage'
//= require 'angular/routes'
//= require 'angular/services/access-token'
//= require 'angular/services/init-config'
//= require 'angular/services/user'
//= require 'angular/controllers/main'
//= require 'angular/controllers/authentication'
//= require 'angular/controllers/users'

$("header").headroom({
  tolerance: 5,
  offset: 205,
  classes: {
    initial: "animated-header",
    pinned: "slideDown",
    unpinned: "slideUp"
  }
});

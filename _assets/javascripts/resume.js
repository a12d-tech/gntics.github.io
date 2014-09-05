$(function() {

  var el = document.getElementById('cmd');
  el.focus();
  el.onblur = function () {
      setTimeout(function () {
          el.focus();
      });
  };

  el.onkeypress = function(e){
    if (!e) e = window.event;
    var keyCode = e.keyCode || e.which;
    if (keyCode == '13'){
      process(el.value);
      return false;
    }
  }

  function process (cmd) {
    console.log(cmd);
    if (cmd === '') {
      $('#text-wrapper').append("<p>
        <i class='fa fa-arrow-right arrow'></i>
        <span class='elt name'>gntics</span>
        <span class='elt git'>git : ( <span class='branch'>resume</span> )</span>
        </p>");
      el.value = "";
    }
    else{
      $('#text-wrapper').append("<p>
        <i class='fa fa-arrow-right arrow'></i>
        <span class='elt name'>gntics</span>
        <span class='elt git'>git : ( <span class='branch'>resume</span> )</span>"
        + cmd + "</p>");
      $('#text-wrapper').append("<p>zsh: command not found: " + cmd + " </p>");
      el.value = "";
    };
  }


});
$(function() {

  $(".console-typing").typed({
      strings: [
        "Welcome ^500 :)",
        "Welcome ^500 to my cli resume. See 'help' for more information about available commands."
      ],
      typeSpeed: 30
  });

  var el = document.getElementById('cmd');
  if (el) {
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
  };

  function process (cmd) {
    console.log(cmd);
    if (cmd === '') {
      $('#text-wrapper').append("<p>
        <i class='fa fa-arrow-right arrow'></i>
        <span class='elt name'>gntics</span>
        <span class='elt git'>git : ( <span class='branch'>resume</span> )</span>
        </p>");
    }
    else{
      $('#text-wrapper').append("<p>
        <i class='fa fa-arrow-right arrow'></i>
        <span class='elt name'>gntics</span>
        <span class='elt git'>git : ( <span class='branch'>resume</span> )</span>"
        + cmd + "</p>");

      if (cmd === 'help') {
        $('#text-wrapper').append("<p id='help'>
          The most commonly used git commands are:<br/>
          <span class='cmd-use'>add</span><span class='cmd-desc'>Add file contents to the index</span><br/>
          <span class='cmd-use'>bisect</span><span class='cmd-desc'>Find by binary search the change that introduced a bug</span><br/>
          <span class='cmd-use'>branch</span><span class='cmd-desc'>List, create, or delete branches</span><br/>
          <span class='cmd-use'>checkout</span><span class='cmd-desc'>Checkout a branch or paths to the working tree</span><br/>
          <span class='cmd-use'>clone</span><span class='cmd-desc'>Clone a repository into a new directory</span><br/>
          <span class='cmd-use'>commit</span><span class='cmd-desc'>Record changes to the repository</span><br/>
          </p>");
      }
      else{
        $('#text-wrapper').append("<p>zsh: command not found: " + cmd + " </p>");
      }
    };
    el.value = "";
  }


});
$(function() {

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
      $('#text-wrapper').append("
        <p class='line'>
          <span class='pre'>></span>
          <span class='folder'>gntics</span>
          <span class='git'>git:(</span>
          <span class='branch'>resume</span>
          <span class='git'>)</span>
        </p>
      ");
    }
    else{
      $('#text-wrapper').append("
        <p class='line'>
          <span class='pre'>></span>
          <span class='folder'>gntics</span>
          <span class='git'>git:(</span>
          <span class='branch'>resume</span>
          <span class='git'>)</span>
          <span class='cmd'>"
          + cmd
          + "</span>
        </p>
      ");

      if (cmd === 'help') {
        $('#text-wrapper').append("
          <p id='help' class='line'>
            The most commonly used 'gntics' commands are:<br/>
            <span class='cmd-use'>education</span><span class='cmd-desc'>Add file contents to the index</span><br/>
            <span class='cmd-use'>skills</span><span class='cmd-desc'>Add file contents to the index</span><br/>
            <span class='cmd-use'>projects</span><span class='cmd-desc'>Add file contents to the index</span><br/>
            <span class='cmd-use'>hobbies</span><span class='cmd-desc'>Find by binary search the change that introduced a bug</span><br/>
            <span class='cmd-use'>learning</span><span class='cmd-desc'>List, create, or delete branches</span><br/>
            <span class='cmd-use'>contact</span><span class='cmd-desc'>Checkout a branch or paths to the working tree</span><br/>
          </p>
        ");
      }
      else{
        $('#text-wrapper').append("<p class='line'>zsh: command not found: " + cmd + " </p>");
      }
    };
    el.value = "";
  }


});
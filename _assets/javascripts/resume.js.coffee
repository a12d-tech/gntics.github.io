$ ->

  el = document.getElementById('cmd')
  if el?
    el.focus()
    el.onblur = ->
      setTimeout ->
        el.focus()
        return
      return

    el.onkeypress = (e) ->
      e = window.event  unless e
      keyCode = e.keyCode or e.which
      if keyCode is 13
        process(el.value)
        false

  process = (cmd) ->
    if cmd is ""
      displayBlankLine()
    else
      displayTypedCmd(cmd)
      switch cmd
        when "help"
          displayHelpCmd()
        else
          displayCmdNotFound(cmd)

    el.value = ""
    $('#console-typing').scrollTop($('#console-typing').height());
    return

  displayBlankLine = ->
    # console.log "displayBlankLine"
    $('#text-wrapper').append("
            <p class='line'>
              <span class='pre'>></span>
              <span class='folder'>gntics</span>
              <span class='git'>git:(</span>
              <span class='branch'>resume</span>
              <span class='git'>)</span>
            </p>")

  displayTypedCmd = (cmd) ->
    # console.log "displayTypedCmd"
    $('#text-wrapper').append """<p class='line'>
              <span class='pre'>></span>
              <span class='folder'>gntics</span>
              <span class='git'>git:(</span>
              <span class='branch'>resume</span>
              <span class='git'>)</span>
              <span class='cmd'>""" + cmd + "</span></p>"

  displayCmdNotFound = (cmd) ->
    $('#text-wrapper').append "<p class='line'>zsh: command not found: " + cmd + "</p>"

  displayHelpCmd = ->
    $('#text-wrapper').append("
            <p id='help' class='line'>
              The most commonly used 'batman' commands are:<br/>
              <span class='cmd-use'>education</span><span class='cmd-desc'>Add file contents to the index</span><br/>
              <span class='cmd-use'>skills</span><span class='cmd-desc'>Add file contents to the index</span><br/>
              <span class='cmd-use'>projects</span><span class='cmd-desc'>Add file contents to the index</span><br/>
              <span class='cmd-use'>hobbies</span><span class='cmd-desc'>Find by binary search the change that introduced a bug</span><br/>
              <span class='cmd-use'>learning</span><span class='cmd-desc'>List, create, or delete branches</span><br/>
              <span class='cmd-use'>contact</span><span class='cmd-desc'>Checkout a branch or paths to the working tree</span><br/>
            </p>
          ")

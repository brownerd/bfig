module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', "bfig:convert", => @convert()

  convert: ->
    # This assumes the active pane iten is an editor
    editor = atom.workspace.getActivePaneItem()
    #editor.insertText('Hello, World')
    selection = editor.getLastSelection()

    figlet = require 'figlet'
    figlet selection.getText(), {font: "brownerd-plus"}, (error, bfig) ->
      if error
        console.error(error)
      else
        selection.insertText("\n#{bfig}\n")

# fig

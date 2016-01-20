{SelectListView} = require 'atom-space-pen-views'
module.exports =
class WebSearchListView extends SelectListView
 initialize: (self)->
   @self = self
   super

 viewForItem: (item) ->
   "<li>#{item.replace(/\/\/(.*?)\//, "// <big>$1</big> /")}</li>"

 confirmed: (item) ->
   @self.search(item)
   @cancel()
   console.log("#{item} was selected")

 cancelled: ->
   @self.panelHide()
   console.log("This view was cancelled")

 destroy: ->
   @cancel()

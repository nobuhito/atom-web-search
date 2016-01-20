{View, $} = require "atom-space-pen-views"
module.exports =
class WebSearchBrowserView extends View
  @content: (params, self) ->
    p = params.position
    s = params.size
    style = if ["top", "bottom"].indexOf(p) > -1 then "width:100%;height:#{s}px" else "height:100%;width:#{s}px"
    @div style:style, =>
      @div class:"web-search inline",  =>
        @button "◀", outlet:"back", style:"float:left", class:"btn"
        @button "▶", outlet:"forward", style:"float:left", class:"btn"
        @button "close", outlet:"close", style:"float:right", class:"btn"
      @tag "webview", src:"#{params.url}", useragent:"#{params.useragent}", outlet:"webview"

  initialize: (params, self) ->
    @self = self
    @close.on "click", =>
      @self.browserHide()
    @back.on "click", =>
      @webview[0].goBack()
    @forward.on "click", =>
      @webview[0].goForward()

  setURL: (url) ->
    @webview.attr("src", url)

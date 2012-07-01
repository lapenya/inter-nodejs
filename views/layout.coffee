doctype 5
html ->
  head ->
    meta charset: 'utf-8'

    title "#{@title} | My Site" if @title?
    meta(name: 'description', content: @description) if @description?
    link(rel: 'canonical', href: @canonical) if @canonical?

    link rel: 'icon', href: '/favicon.png'
    link rel: 'stylesheet', href: '/app.css'

    script src: 'http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'
    script src: '/app.js'

    coffeescript ->
      $(document).ready ->

    style '''
      header, nav, section, article, aside, footer {display: block}
      nav li {display: inline}
      nav.sub {float: right}
      #content {margin-left: 120px}
    '''
  body ->
    header ->

    div id: 'content', ->
      @body

    footer ->

module Xdsd
  class PictureBlock < Liquid::Tag
    def initialize(tag, markup, tokens)
      super
      opts = markup.split(/\s+/, 3)
      @src = opts[0].strip
      @width = opts[1].strip
      @title = opts[2].strip
    end
    def render(context)
      "<figure><img src='#{CGI::escapeHTML @src}'" +
      " style='width:#{@width}px;'" +
      " alt='#{CGI::escapeHTML @title}'/>" +
      "<figcaption>#{CGI::escapeHTML @title}</figcaption></figure>\n\n"
    end
  end
end

Liquid::Template.register_tag("picture", Xdsd::PictureBlock)
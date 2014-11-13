class DoughSnippetRender < Redcarpet::Render::HTML
  def header(text, level)
    if level == 2
      "<h#{level}><a name='#{text.parameterize.gsub('_','-')}' href='##{text.parameterize.gsub('_','-')}'>#{text}</a></h#{level}>"
    else
      "<h#{level}>#{text}</h#{level}>"
    end
  end
end

require 'dough_gem_info'
require "dough/snippet_render"

class DoughExample
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def code_path
    "#{DoughGemInfo.docs_path}/helpers/#{name.camelize}.erb"
  end

  def code_raw_html
    File.read code_path
  end

  def code_processed_html
    ERB.new(code_raw_html)
  end

  def name
    path.match(*/\/docs\/(.*)\.md/)[1].underscore
  end

  def doc_markdown
    File.read path
  end

  def doc_html
    renderer = DoughSnippetRender
    parser = Redcarpet::Markdown.new(renderer)
    parser.render doc_markdown
  end
end

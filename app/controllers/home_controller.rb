require 'dough_example'

class HomeController < ApplicationController
  def index
    @components ||= dough_documents.map { |path| DoughExample.new(path) }
    @components.sort! { |a,b| a.slug <=> b.slug }
  end

  protected

  def dough_documents
    Dir[File.join(DoughGemInfo.docs_path, '*.md')]
  end
end

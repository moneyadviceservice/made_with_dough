require 'bundler'

class DoughGemInfo
  class << self
    def docs_path
      dough_gem_info = gem_path('dough-ruby')
      File.join(dough_gem_info.full_gem_path, 'docs')
    end

    protected

    def gem_path(gem)
      Bundler.rubygems.find_name(gem).first
    end
  end
end

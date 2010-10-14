module JBuilder
  
  class JBuilderHandler < ActionView::Template::Handler
    def self.call(template)
      "json = JBuilder::JBuilderDsl.new;\n#{template.source};\njson.output;"
    end
  end

end
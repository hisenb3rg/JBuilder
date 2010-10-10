module JBuilder
  
  class JBuilderHandler < ActionView::Template::Handler
    def self.call(template)
      result  = "json = JBuilder::JBuilderDsl.new;\n"
      result += "self.class.send :define_method, :object, Proc.new {|*args, &code| json.object(*args, &code)};\n"
      result += "self.class.send :define_method, :array, Proc.new {|*args, &code| json.array(*args, &code)};\n"
      result += "self.class.send :define_method, :value, Proc.new {|*args| json.value(*args)};\n"
      result += "#{template.source};\n"
      result += "json.output;"
      result
    end
  end

end
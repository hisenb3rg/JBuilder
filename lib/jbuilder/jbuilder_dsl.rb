module JBuilder

  class JBuilderDsl
  
    def initialize
      @content = [ActiveSupport::OrderedHash.new]
      # @content = [hash_class.new]
    end
  
    def method_missing(method, *args, &block)
      name, other = method, args
    
      # key-val pair?
      if !block_given? and (other.size <= 1)
        value(name, *other)
      # object?
      elsif block_given? && other.blank? or !block_given? && (other.size == 1) && other.first.is_a?(Hash)
        if block_given?
          object(name, *other, &block)
        else
          object(name, *other)
        end
      # array?  
      elsif block_given? && (other.first == :array) or !block_given? && (other.size == 1) && other.first.is_a?(Array)
        if block_given?
          array(name, *other, &block)
        else
          array(name, *other)
        end
      else
        raise "Template syntax error"
      end
    end
  
  
    def object(*args)
      name, other = *normalize_args(args)
      if block_given?
        new_content = ActiveSupport::OrderedHash.new
        set_new_content(name, new_content)
        @content << new_content
        yield(self)
        @content.pop
      elsif other.first.is_a? Hash
        set_new_content(name, other.first)
      else
        raise "only hash allowed for object"
      end
    end
  
    def array(*args)
      name, other = *normalize_args(args)    
      if block_given?
        new_content = []
        set_new_content(name, new_content)
        @content << new_content
        yield(self)
        @content.pop
      else
        new_content = other
        new_content = other.first if other.size == 1 and other.first.is_a? Array
        set_new_content(name, new_content)
      end
    end
  
    def value(name, value)
      @content.last[name] = value
    end
  
    def current_content
      @content.last
    end  
  
    def output
      result = current_content.size == 1 && current_content.values.first.is_a?(Array) ? current_content.values.first : current_content
      # result = current_content
      JSON.generate(result)
    end
  
  
    private
  
      def set_new_content(key, content)
        if current_content.is_a? Array
          current_content << content
        else
          current_content[key] = content
        end
      end
  
      def normalize_args(args)
        name = args.first.is_a?(String) || args.first.is_a?(Symbol) ? args.delete_at(0) : nil
        [name, args]
      end  
      
      def self.hash_class
        defined?(ActiveSupport::OrderedHash) ? ActiveSupport::OrderedHash : Hash
      end
  end
end
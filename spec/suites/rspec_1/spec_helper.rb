require 'spec/autorun'

require File.expand_path('../../../global_helper', __FILE__)

module ExampleMethods
  def eigen(object)
    class << object; self; end
  end
end

module ExampleGroupMethods
  def macro(name, &implementation)
    (class << self; self; end).class_eval do
      define_method(name, &implementation)
    end
  end
end

Spec::Runner.configure do |c|
  c.include ExampleMethods
  c.extend ExampleGroupMethods
end

Dir[ File.expand_path('../shared/*.rb', __FILE__) ].each {|fn| require fn }

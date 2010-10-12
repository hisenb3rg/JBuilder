require 'jbuilder/jbuilder_dsl'
require 'jbuilder/jbuilder_handler'
require 'rails'


module JBuilder
  class Railtie < Rails::Railtie
    initializer "jbuilder_railtie.configure_rails_initialization" do |app|
      puts "gem initialized!"
      ActionView::Template.register_template_handler(:jbuilder, ::JBuilder::JBuilderHandler)
    end
  end
end
module AngularRailsTemplates
  class Engine < ::Rails::Engine
    config.angular_templates = ActiveSupport::OrderedOptions.new
    config.angular_templates.module_name   = 'templates'
    config.angular_templates.templates_dir = 'angular/templates'

    config.before_initialize do |app|
      Sprockets::Engines #force autoloading
      Sprockets.register_engine '.ajs', AngularRailsTemplates::Template
      Sprockets.register_engine '.html', AngularRailsTemplates::Template
    end
  end
end

#require 'mercury-rails'

module EditableContent
  class Engine < ::Rails::Engine
    #isolate_namespace EditableContent
    
    initializer :assets, :group => :all do |app|
      app.config.assets.precompile += %w( jquery-1.7.js )
    end

    # Require mercury authentication module and potentially other aspects later (so they can be overridden).
    initializer 'mercury.add_lib' do |app|
      require 'mercury/authentication'
    end

  end
end
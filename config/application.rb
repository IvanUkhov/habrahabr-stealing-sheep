require 'bundler'
Bundler.require(:default)

module StopStealingSheep
  class Application < Rail::Application
    config.precompile << 'application.css'
    config.precompile << 'application.js'
    config.precompile << 'index.html'
  end
end

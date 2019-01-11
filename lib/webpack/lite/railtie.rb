require "webpack/lite/helper"

module Webpack
  module Lite
    # Hooks our library into Rails
    class Railtie < Rails::Railtie
      initializer "webpack-lite.helper" do
        ActiveSupport.on_load :action_controller do
          ActionController::Base.helper Webpack::Lite::Helper
        end

        ActiveSupport.on_load :action_view do
          include Webpack::Lite::Helper
        end
      end
    end
  end
end

require "webpack/lite/version"
require "webpack/lite/helper"
require "webpack/lite/manifest"
require "webpack/lite/railtie" if defined?(Rails)

module Webpack
  module Lite
    class Error < StandardError; end

    class << self
      def configure
        yield self
      end

      attr_accessor :manifest_path
      @manifest_path = "public/packs/manifest.json"
    end
  end
end

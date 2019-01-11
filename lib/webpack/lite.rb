require "webpack/lite/version"
require "webpack/lite/helper"
require "webpack/lite/manifest"
require "webpack/lite/railtie" if defined?(Rails)

module Webpack
  # Main entry
  module Lite
    class Error < StandardError; end

    class << self
      def configure
        yield self
      end

      attr_writer :manifest_path

      def manifest_path
        @manifest_path || "public/packs/#{Rails.env}/manifest.json"
      end
    end
  end
end

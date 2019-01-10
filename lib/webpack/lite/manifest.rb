module Webpack
  module Lite
    class Manifest
      def self.instance
        @manifest ||= new(Webpack::Lite.manifest_path)
      end

      def self.path(asset_name)
        instance.path(asset_name)
      end

      def initialize(manifest_path)
        @manifest_path = manifest_path
        @last_modified = Time.local(1970)
      end

      def path(asset_name)
        assets[asset_name]
      end

      private

      attr_reader :manifest_path

      def assets
        @assets ||= JSON.parse(File.read(manifest_path))
      end
    end
  end
end

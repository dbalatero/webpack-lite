require "json"

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
        @last_modified = File.mtime(manifest_path)
      end

      def path(asset_name)
        assets[asset_name]
      end

      private

      attr_reader :manifest_path, :last_modified

      def assets
        clear_assets_if_modified!

        @assets ||= JSON.parse(File.read(manifest_path))
      end

      def clear_assets_if_modified!
        mtime = File.mtime(manifest_path)

        if mtime > last_modified
          @assets = nil
          @last_modified = mtime
        end
      end
    end
  end
end

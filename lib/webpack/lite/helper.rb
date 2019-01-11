module Webpack
  module Lite
    # Provides controller and view helpers to Rails to get the full
    # path to your assets.
    module Helper
      def webpack_asset_path(asset_name)
        Webpack::Lite::Manifest.path(asset_name)
      end

      def javascript_webpack_tag(asset_name, **options)
        javascript_include_tag(webpack_asset_path(asset_name), options)
      end

      def stylesheet_webpack_tag(asset_name, **options)
        stylesheet_link_tag(webpack_asset_path(asset_name), options)
      end
    end
  end
end

require "spec_helper"

RSpec.describe Webpack::Lite::Helper do
  class TestHelper
    include Webpack::Lite::Helper

    def javascript_include_tag(path, **_options)
      "<script src=\"#{path}\"></script>"
    end

    def stylesheet_link_tag(path, **_options)
      "<link href=\"#{path}\"></link>"
    end
  end

  subject { TestHelper.new }

  before do
    allow(Webpack::Lite).to receive(:manifest_path) do
      "spec/fixtures/manifest.json"
    end
  end

  describe "#webpack_asset_path" do
    it "should return the path to the asset" do
      expect(subject.webpack_asset_path("main.js")).to eq("/packs/main.js")
    end
  end

  describe "#javascript_webpack_tag" do
    it "should pass thru to javascript_include_tag" do
      expect(subject.javascript_webpack_tag("main.js")).to eq(
        <<~EOF.strip
          <script src="/packs/main.js"></script>
        EOF
      )
    end
  end

  describe "#stylesheet_webpack_tag" do

    it "should pass thru to stylesheet_include_tag" do
      expect(subject.stylesheet_webpack_tag("main.js")).to eq(
        <<~EOF.strip
          <link href="/packs/main.js"></link>
        EOF
      )
    end
  end
end

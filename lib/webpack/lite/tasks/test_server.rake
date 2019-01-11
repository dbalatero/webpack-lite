require "webpack/lite/tasks"

namespace :webpack do
  namespace :lite do
    desc "Run a Webpack development watch server"
    task :test_server do
      Webpack::Lite::Tasks.exec(
        "./node_modules/.bin/webpack --watch",
        "RAILS_ENV" => "test",
        "NODE_ENV" => "development"
      )
    end
  end
end

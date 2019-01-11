require "webpack/lite/tasks"

namespace :webpack do
  namespace :lite do
    desc "Run a Webpack development watch server"
    task :dev_server do
      Webpack::Lite::Tasks.exec(
        "./node_modules/.bin/webpack --watch",
        "RAILS_ENV" => "development",
        "NODE_ENV" => "development"
      )
    end
  end
end

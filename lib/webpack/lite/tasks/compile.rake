require "webpack/lite/tasks"

namespace :webpack do
  namespace :lite do
    desc "Does a single compilation of your Webpack targets"

    def node_env_from_rails_env
      ENV["RAILS_ENV"] == "production" ? "production" : "development"
    end

    task :compile do
      ENV["RAILS_ENV"] ||= "development"

      Webpack::Lite::Tasks.exec(
        "./node_modules/.bin/webpack",
        "RAILS_ENV" => ENV["RAILS_ENV"],
        "NODE_ENV" => ENV["NODE_ENV"] || node_env_from_rails_env
      )
    end
  end
end

namespace :webpack do
  namespace :lite do
    desc "Run a Webpack development watch server"
    task :dev do
      exec(
        {
          "RAILS_ENV" => "development",
          "NODE_ENV" => "development"
        },
        "./node_modules/.bin/webpack --watch"
      )
    end
  end
end

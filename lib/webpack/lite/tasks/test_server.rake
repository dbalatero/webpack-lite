namespace :webpack do
  namespace :lite do
    desc "Run a Webpack development watch server"
    task :test_server do
      exec(
        {
          "RAILS_ENV" => "test",
          "NODE_ENV" => "development"
        },
        "./node_modules/.bin/webpack --watch"
      )
    end
  end
end

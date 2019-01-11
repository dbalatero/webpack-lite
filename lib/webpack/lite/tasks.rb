module Webpack
  module Lite
    module Tasks
      class << self
        def exec(command, env = {})
          log_exec(command, env)
          Kernel.exec(env, command)
        end

        private

        def log_exec(command, env)
          env_vars = env.each_with_object([]) do |(key, value), vars|
            vars << "#{key}=#{value}"
          end

          cmd_string = ""

          unless env_vars.empty?
            cmd_string << env_vars.join(" ")
            cmd_string << " "
          end

          cmd_string << command

          print "📦  $ "
          print "\e[34m" # blue
          print cmd_string.to_s
          print "\e[0m" # /blue
          puts
          puts
        end
      end
    end
  end
end

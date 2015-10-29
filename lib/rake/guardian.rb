require "rake/guardian/version"
require "rake/guardian/config"
require "rake/application"

module Rake
  module Guardian
    def invoke_task(task_string)
      name, _ = parse_task_string(task_string)
      if need_guard?(name)
        $stderr.puts "[rake-guardian] #{name} can not invoke."
        return 0
      end
      super
    end

    def need_guard?(task_name)
      env = ENV['RAILS_ENV']
      config = Rake::Guardian.config

      if config.env.include?(env) && config.tasks.include?(task_name)
        true
      else
        false
      end
    end
  end
end
Rake::Application.prepend(Rake::Guardian)

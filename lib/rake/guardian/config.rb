require 'active_support/configurable'

module Rake::Guardian
  class Configuration
    include ActiveSupport::Configurable
    config_accessor :env do
      %w(production)
    end

    config_accessor :tasks do
      %w(db:drop db:reset db:purge db:drop:all)
    end
  end

  def self.configure(&block)
    yield config
  end

  def self.config
    @_config ||= Rake::Guardian::Configuration.new
  end
end

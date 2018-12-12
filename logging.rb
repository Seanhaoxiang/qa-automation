require_relative 'spec_helper'

module Logging

  include Config

  class << self
    def logger
      @logger ||= Logger.new log_file
      @logger.level = log_level
      @logger
    end

    def logger=(logger)
      @logger = logger
    end
  end

  def self.included(base)
    class << base
      def logger
        Logging.logger
      end
    end
  end

  def logger
    Logging.logger
  end

end

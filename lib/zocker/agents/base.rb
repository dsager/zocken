module Zocker
  module Agents
    class Base
      def initialize(config)
        @config = config
      end

      def run
        log 'running...'
      end

      private

      def log(message)
        puts "    [#{@config.name}] #{message}"
      end
    end
  end
end

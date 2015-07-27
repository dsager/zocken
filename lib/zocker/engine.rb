module Zocker
  class Engine
    attr_accessor :agents

    def setup_agents(agent_config_list)
      log 'building agents'
      @agents = agent_config_list.map do |agent_config|
        build_agent OpenStruct.new(agent_config)
      end
    end

    def build_agent(agent_config)
      log "building agent '#{agent_config.name}'"
      agent_class = Zocker::Agents::Base
      agent_class.new(agent_config)
    end

    def run
      log 'starting run'
      n_iterations = 10
      n_iterations.times { run_iteration }
      log 'finished run'
    end

    def run_iteration
      log 'run iteration'
      agents.shuffle.each { |agent| agent.run }
    end

    private

    def log(message)
      puts "  [ENGINE] #{message}"
    end
  end
end

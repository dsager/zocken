namespace :zocker do
  desc 'run zocker'
  task :run do
    require 'zocker/zocker'
    setup_her
    # agents = [{ name: 'Hans' }, { name: 'Werner' }, { name: 'Klaus' }]
    # engine = Zocker::Engine.new
    # engine.setup_agents(agents)
    # engine.run
    puts Zocker::Models::Bet.all
  end

end

def setup_her
  Her::API.setup url: 'http://0.0.0.0:3000' do |c|
    # TODO: authentication, see https://github.com/remiprev/her#authentication
    c.use Faraday::Request::UrlEncoded
    c.use Her::Middleware::DefaultParseJSON
    c.use Faraday::Adapter::NetHttp
  end
end

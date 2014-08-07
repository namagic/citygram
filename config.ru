require './app'

unprotected_routes = [
  Citygram::Routes::Events,
  Citygram::Routes::Publishers,
  Citygram::Routes::Subscriptions,
  Citygram::Routes::Pages
]

protected_routes = [
  Citygram::Routes::Unsubscribes
]

run Rack::URLMap.new(
  '/' => Rack::Cascade.new(unprotected_routes),
  '/protected' => Rack::Cascade.new(protected_routes)
)

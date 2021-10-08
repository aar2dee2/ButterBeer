mix local.hex --if-missing --force
mix local.rebar --force

cd butterbeer
mix deps.get
mix deps.compile

iex -S mix phx.server
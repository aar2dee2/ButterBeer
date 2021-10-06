mix local.hex --if-missing --force
mix local.rebar --force

cd butterbeer
iex -S mix phx.server
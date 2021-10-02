## Setup for Phoenix app in Nix repl

1. Edit the .replit file and add the following code:
```
run = """
mix local.hex --if-missing --force
"""

[env]
LC_ALL = "en_US.UTF-8"
```

`mix local.hex` installs Hex, the Elixir package manager. UTF-8 encoding is required for the Erlang VM to function properly.

2. Add required dependencies to your replit.nix file. In the latest version of Phoenix - 1.6 - node is no longer required. Hence, we'all add only elixir, postgresql and inotify-tools (required on Linux). Here's the code for the updated replit.nix file:
```
{ pkgs }: {
	deps = [
		pkgs.elixir
    pkgs.postgresql_13
    pkgs.inotify-tools
	];
}
```

3. Install Phoenix with `mix archive.install hex phx_new 1.6.0`

4. Create a new project. Butterbeer will be the umbrella app so using  `mix phx.new butterbeer --umbrella --live`

5. Add database credentials to Replit secrets and update the code in config/dev.exs. 

Default code in dev.exs:
```
config :butterbeer, Butterbeer.Repo,
  username: "postgres",
  password: "postgres",
  database: "butterbeer_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with esbuild to bundle .js and .css sources.
config :butterbeer_web, ButterbeerWeb.Endpoint,
  # Binding to loopback ipv4 address prevents access from other machines.
  # Change to `ip: {0, 0, 0, 0}` to allow access from other machines.
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
```

Updated code in dev.exs:
```
# Configure your database
config :butterbeer, Butterbeer.Repo,
  username: System.get_env["DB_USER"],
  password: System.get_env["DB_PASSWORd"],
  database: System.get_env["DB_NAME"],
  hostname: System.get_env["DB_URL"],
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with esbuild to bundle .js and .css sources.
config :butterbeer_web, ButterbeerWeb.Endpoint,
  # Binding to loopback ipv4 address prevents access from other machines.
  # Change to `ip: {0, 0, 0, 0}` to allow access from other machines.
  http: [ip: {0, 0, 0, 0}, port: 5432],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
```

Have updated database credentials as well as port and ip address.

6. Need to reload the repl here otherwise Replit doesn't store the environment variables properly.

7. Now creating the database. `cd butterbeer_umbrella` and `mix ecto.create`. Enter `Y` when asked to install rebar3.

8. Start server with `iex -S mix phx.server` and it's Up and Running!
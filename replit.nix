{ pkgs }: {
	deps = [
		pkgs.elixir
    pkgs.postgresql_13
    pkgs.inotify-tools
	];
}
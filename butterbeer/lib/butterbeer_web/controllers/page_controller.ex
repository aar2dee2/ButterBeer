defmodule ButterbeerWeb.PageController do
  use ButterbeerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

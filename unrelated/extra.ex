defmodule Extra do
  
  @doc """
  elixir translation for a Javascript function here: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures
  """
  def init() do
    name = "Mozilla"
    display_name = fn() -> IO.puts(name) end
    #to return the inner function before execution, we use display_name, to return the result of its execution directly we can use display_name.()
    display_name
  end
end
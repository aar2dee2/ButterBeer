defmodule ButterbeerWeb.FeedLive do
  def mount(_params, _session, socket) do
    {
      :ok,
      assign(
        socket,
        #Need to add diffs to be tracked
      )
    }
  end

  def render(assigns) do
    #Need to add components to template below
    ~H"""
    <h1>
      Feed
    </h1>

    <h2>
     
    </h2>

    <h2>
      
    </h2>
    
    """
  end
end
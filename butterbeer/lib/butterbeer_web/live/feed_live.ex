defmodule ButterbeerWeb.FeedLive do
  use ButterbeerWeb, :live_view
  
  def mount(_params, _session, socket) do
    #Need to add diffs to be tracked    
    {
      :ok,
      assign(
        socket, 
        :time, DateTime.utc_now() |> to_string()
        )
    }
  end

  def render(assigns) do
    #Need to remove the Routes.. paths
    ~H"""
    <table>
      <thead>
        <tr>
          <th>Place</th>
          <th>Description</th>
          <th>User</th>
          <th>View on Google Maps</th>
        </tr>
      </thead>
      <tbody>
        <%= for dine_post <- @dineposts do %>
          <tr>
            <td><%= dine_post.place_id %></td>
            <td><%= dine_post.description %></td>
            <td><%= dine_post.user_id %></td>
            <td><%= dine_post.url %></td>
            <td>
              <!-- Remove the Routes... path-->
              <span><%= link "Show", to: Routes.dine_post_path(@conn, :show, dine_post) %></span>
              <span><%= link "Edit", to: Routes.dine_post_path(@conn, :edit, dine_post) %></span>
              <span><%= link "Delete", to: Routes.dine_post_path(@conn, :delete, dine_post), method: :delete, data: [confirm: "Are you sure?"] %></span>
            </td>
          </tr>
        <% end %>
      </tbody>
    </table>

    <span>
      <button type="button">
      <!-- Remove the Routes... path-->
        <%= link "New Dine post", to: Routes.dine_post_path(@conn, :new) %>
      </button>
    </span>
    
    """
  end
end
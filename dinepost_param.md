Parameters: %{ 
"admin_area_one" => "Delhi", 
"admin_area_two" => "South Delhi", 
"country" => "India", 
"dine_post" => %{"description" => "Blueberry and chestnut yule log"}, 
"locality" => "New Delhi", 
"neighborhood" => "", 
"place_id" => "ChIJf27ZF9EfDTkRjLgdF3mmDic", 
"place_name" => "Cafe Monique", 
"url" => "https://maps.google.com/?cid=2814369856162216076"}

 <%= link "Edit", to: Routes.dine_post_path(@conn, :edit, dine_post) do %>
            <i class="far fa-edit"></i>
          <% end %>

          <%= link "Delete", to: Routes.dine_post_path(@conn, :delete, dine_post), method: :delete, data: [confirm: "Are you sure?"] do %>
            <i class="far fa-trash-alt"></i>
          <% end %>
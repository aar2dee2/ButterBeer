# Location Context - Design and Functionality

A 'Location' contains all related information for identifying a place.

A location may serve dining or shopping or both. These can be a Boolean properties in the location table



At the moment two types of posts are planned for Butter Beer - posts on Dining, and posts on product recommendations. This markdown describes the Dining posts.

This context will be accessible to the web-app as read and write for all signed up and logged in users. So the generator being used is `mix phx.gen.html` and not `mix.phx.gen.context`

Command used `mix phx.gen.html Feed DinePost dineposts place_id:references:places user_id:references:users created_at:naive_datetime description:string`

DB schemas in the `Feed` context:

1. `areas_level_1` - admin_area_level_1 in the Places [address_components_types](https://developers.google.com/maps/documentation/javascript/geocoding#GeocodingAddressTypes) array
    - country_id:references:countries
    - long_name:string
    - created_at:naive_datetime
    - short_name:string
    - unique_id: long_name_country_id
2. `areas_level_2` - admin_area_level_2 in the Places [address_components_types](https://developers.google.com/maps/documentation/javascript/geocoding#GeocodingAddressTypes) array
    - area_level_1:references:areas_level_1
    - long_name:string
    - short_name:string
    - created_at:naive_datetime
    - unique_id: long_name_area_level_1

3. `localities`
    - area_level_2:references:areas_level_2
    - long_name:string
    - short_name:string
    - unique_id: long_name_area_level_2

4. `neighborhoods`
    - long_name:string
    - short_name:string
    - locality:references:localities
    - unique_id: long_name_locality

5. `places`
    - name:string
    - website:string
    - maps_link:string
    - neighborhood:references:neighborhoods
    - unique_id:name_neighborhood
    
## To-dos:
Check if I can show the post with the Google Maps link (View on Maps button on post when it appears in the Feed)
# Location Context - Design and Functionality

A 'Location' contains all related information for identifying a place.

A location may serve dining or shopping or both. These can be a Boolean properties in the location table



At the moment two types of posts are planned for Butter Beer - posts on Dining, and posts on product recommendations. This markdown describes the Dining posts.

This context will be accessible to the web-app as read and write for all signed up and logged in users. So the generator being used is `mix phx.gen.html` and not `mix.phx.gen.context`

Command used `mix phx.gen.html Feed DinePost dineposts place_id:references:places user_id:references:users created_at:naive_datetime description:string`

DB schemas in the `Feed` context:

1. `areas_level_one` - admin_area_level_1 in the Places [address_components_types](https://developers.google.com/maps/documentation/javascript/geocoding#GeocodingAddressTypes) array
    - country_id:references:countries
    - long_name:string
    - short_name:string
    - unique_id: long_name_country_id
    
2. `areas_level_2` - admin_area_level_2 in the Places [address_components_types](https://developers.google.com/maps/documentation/javascript/geocoding#GeocodingAddressTypes) array
    - area_level_1:references:areas_level_one
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

## Countries DB

The `countries` table was taken from [UN Statistics Division](https://unstats.un.org/unsd/methodology/m49/overview/)
Made the following changes:

1. Name change
    - "Cabo Verde" to "Cape Verde" (id 46)
    - "Bonaire, Sint Eustatius and Saba" to "Caribbean Netherlands" (id 66)
    - "Bosnia and Herzegovina" to "Bosnia & Herzegovina" (id 198)
    - "Antigua and Barbuda" to "Antigua & Barbuda" (id 62)
    - "Congo" to "Congo-Brazzaville" (id 34)
    - "Democratic Republic of the Congo" to "Congo-Kinshasa" (id 35)
    - "Falkland Islands (Malvinas)" to "Falkland Islands (Malvinas)" (id 104)
    - "Democratic People's Republic of Korea" to "North Korea" (id 127)
    - "Heard Island and McDonald Islands" to "Heard & McDonald Islands" (id 224)
    - "Hong Kong, China" to "Hong Kong" (id 125)
    - "Iran (Islamic Republic of)" to "Iran" (id 146)
    - "Lao People's Democratic Republic" to Laos (id 134)
    - "Macao, China" to "Macao" (id 126)
    - "Micronesia (Federated States of)" to "Micronesia" (id 235)
    - "Myanmar" to "Myanmar (Burma)" (id 136)
    - "Republic of Moldova" to "Moldova" (id 174)
    - "Pitcairn" to "Pitcairn Islands" (id 244)
    - "Russian Federation" to "Russia" (id 176)
    - "Republic of Korea" to "South Korea" (id 130)
    - "Sint Maarten (Dutch part)" to "Sint Maarten" (id 85)
    - "South Georgia and the South Sandwich Islands" to "South Georgia & South Sandwich Islands" (id 109)
    - "Saint Barthélemy" to "St. Barthélemy" (id 80)
    - "Saint Helena" to "St. Helena" (id 57)
    - "Saint Kitts and Nevis" to "St. Kitts & Nevis" (id 81)
    - "Saint Lucia" to "St. Lucia" (id 82)
    - "Saint Martin (French Part)" to "St. Martin" (id 83)
    - "Saint Pierre and Miquelon" to "St. Pierre & Miquelon" (id 116)
    - "Saint Vincent and the Grenadines" to "St. Vincent & Grenadines" (id 84)
    - "State of Palestine" to "Palestine" (id 164)
    - "Svalbard and Jan Mayen Islands" to "Svalbard & Jan Mayen" (id 193)
    - "Syrian Arab Republic" to "Syria" (id 165)
    - "Sao Tome and Principe" to "São Tomé & Príncipe" (id 38)
    - "United Republic of Tanzania" to "Tanzania" (id 27)
    - "Trinidad and Tobago" to "Trinidad & Tobago" (id 86)
    - "Turks and Caicos Islands" to "Turks & Caicos Islands" (id 87)
    - "United States Minor Outlying Islands" to "U.S. Outlying Islands" (id 239)
    - "United States Virgin Islands" to "U.S. Virgin Islands" (id 88)
    - "United Kingdom of Great Britain and Northern Ireland" to "United Kingdom" (id 195)
    - "United States of America" to "United States" (id 117)
    - "Venezuela (Bolivarian Republic of)" to "Venezuela" (id 112)
    - "Viet Nam" to "Vietnam" (id 141)
    - "Wallis and Futuna Islands" to "Wallis & Futuna" (id 249)

2. Additions
    - "Ascension Island" (id 250)
    - "Canary Islands" (id 251)
    - "Ceuta & Melilla" (id 252)
    - "Diego Garcia" (id 253)
    - "Taiwan" (id 254)
    - "Tristan da Cunha" (id 255)
    - "Vatican City" (id 256)


Not adding the following from the [Google Maps Countries List](https://developers.google.com/maps/coverage)
    - Clipperton Island (uninhabited)
    - 
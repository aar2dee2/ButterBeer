# Tag Context - Design and Functionality

'Tags' are searchable keywords that maybe associated with a restaurant, dish or food product. These will belong to different categories e.g. `cuisines`, `restaurant_types`, `dining_options`, `flavours` and so on.

The context will be accessible to the web-app as read-only, whereas admin routes will be created for entire CRUD functionality. So the generator being used is `mix phx.gen.html` and not `mix.phx.gen.context`

DB schemas in the Tag context:

1. `cuisines` - 
    - id - primary key
    - name - citext
    - country_id - references:countries not_null:false
    - is_parent: boolean
    - is_child: boolean
    - alias - array? (e.g. Asian and Pan-Asian)

2. `dining_options` - options include `dine-in, takeaway, delivery`
    - 

3. `dining_types` - options like `restaurant, cafe, bar, `

4. `suitability` - options like `child_friendly, pet_friendly, wheelchair_accessible`
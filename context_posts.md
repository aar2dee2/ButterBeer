# Post Context - Design and Functionality

A 'post' is collection of related information shared by a user (such as a Twitter or Facebook posts) in a pre-defined format. 

At the moment two types of posts are planned for Butter Beer - posts on Dining, and posts on product recommendations.

This context will be accessible to the web-app as read and write for all signed up and logged in users. So the generator being used is `mix phx.gen.html` and not `mix.phx.gen.context`

DB schemas in the Tag context:

1. `dineposts` - 
    - id - primary key
    - place - references:places
    - 
    - posted_by - references:users
    - created_at - timestamp
    - 
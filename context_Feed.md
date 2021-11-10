# Feed Context - Design and Functionality

A 'post' is collection of related information (such as a Twitter or Facebook post) shared by a user in a pre-defined format. 

At the moment two types of posts are planned for Butter Beer - posts on Dining, and posts on product recommendations. This markdown describes the Dining posts.

This context will be accessible to the web-app as read and write for all signed up and logged in users. So the generator being used is `mix phx.gen.html` and not `mix.phx.gen.context`

Command used `mix phx.gen.html Feed DinePost dineposts place_id:references:places user_id:references:users created_at:naive_datetime description:string`

DB schemas in the `Feed` context:

1. `dineposts` - 
    - place_id:references:places
    - user_id:references:users
    - created_at:timestamp
    - description:string
    - 
2. `upvotes`
    - post:references:dineposts
    - upvoted_by:references:user

3. `downvotes`
    - post:references:dineposts
    - downvoted_by:references:users

4. 

## To-dos:
Check if I can show the post with the Google Maps link (View on Maps button on post when it appears in the Feed)
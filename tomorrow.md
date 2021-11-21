# Begin here:

1. After successful login, redirect to Feed not the homepage showing currently (which is similar to homepage when logged out)

2. Create button for new post on the Feed page

3. Changes in Feed and DinePost
      - user_id should be passed to the DinePost changeset function when creating a new DinePost
      - In new DinePost template,
        1. option to select country from dropdown - link to countries schema
        2. autocomplete search for admin_area_one and admin_area_two - directly included the requisite JS in the template. 
        3. autocomplete search for place
        4. When submit button is clicked - write to location schemas in decreasing order of admin levels - first to areas_level_one, then areas_level_two, then localities, then neighborhoods, and finally places.
        5. remove edit DinePost option for now - can make all pages except `edit` accessible in the router.ex file
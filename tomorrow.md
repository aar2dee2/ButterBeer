# Begin here:

1. After successful login, redirect to Feed not the homepage showing currently (which is similar to homepage when logged out) - done

2. Create button for new post on the Feed page

3. Changes in Feed and DinePost
      - user_id should be passed to the DinePost changeset function when creating a new DinePost
      - In new DinePost template,
        1. autocomplete search for place
        2. When submit button is clicked - write to location schemas in decreasing order of admin levels - first to areas_level_one, then areas_level_two, then localities, then neighborhoods, and finally places.
        3. remove edit DinePost option for now - can make all pages except `edit` accessible in the router.ex file

4. Create and add Butter Beer logo
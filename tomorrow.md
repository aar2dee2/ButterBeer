# Begin here:

1. After successful login, redirect to Feed not the homepage showing currently (which is similar to homepage when logged out) - done

2. Create button for new post on the Feed page - done

3. Changes in Feed and DinePost
      - user_id should be passed to the DinePost changeset function when creating a new DinePost
      - In new DinePost template,
        1. autocomplete search for place
        2. When submit button is clicked - write to location schemas in decreasing order of admin levels - first to areas_level_one, then areas_level_two, then localities, then neighborhoods, and finally places.
        3. remove edit DinePost option for now - can make all pages except `edit` accessible in the router.ex file

4. Create and add Butter Beer logo

Removed place_id from DinePost.changeset, so the dinepost is now getting added to db, but only with description - the place details from google maps API are not there in the parameters, even though they show up correctly on the template.

was also getting error in the dinepost index template as dinepost.url is not a field. Need to fix this later - connect to the website from the places table for the respective place_id

Replaced input type for place search field in dinepost form.html with "search" instead of "text". No specific reason for doing this, except to just try it out. Search is working fine and there is now a 'x' at the end of the field to clear out the text.

[`.eq()`](https://api.jquery.com/eq-selector/) 
selector is an index-based selector, i.e. it will return the element matching the index specified. To fetch all rows in a table that have a specific value in a column, use the [.filter()]() method


const btn = document.querySelector("button");

      btn.onclick = () => {

      }

      return JSON.stringify(place);
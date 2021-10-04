## Database for ButterBeer

ButterBeer is a social app and needs a number of database schemas that will store information on its various features.

3 User schemas will be used:

1. #### __users__: 
  The basic user schema that will use be used for registration and authentication.
  
  
  `Note` need to see how Supabase auth with Twitter can be used here and if the fields can be pulled from Twitter itself.

  
  Columns will include:
      
      1. id: primary key column (int type)
      2. username: varchar between 2-20 characters - allows lowercase letters and digits between 0-9 - so that is 36 ** 20 possibilities (1.33e31 - so several trillion possibilities)
      3. firstname: varchar
      4. lastname: varchar
      5. phone_number: integer (excluding country code)
      6. country: link to country table
      7. country_code:
      8. email: 

2. #### __user_profiles__:

  Columns will include:

      1. id: link to id in the __User__ schema
      2. Picture field?
      3. Food preferences
      4. 

3. #### __user_public__:
  Information visible to other users in the app

  not to be in the table: Followers - this will be count of rows from __followers__ table - 

  Columns will include:

      1. id: link to id in __User__ schema
      2. username: link to username in __User__ schema
      3. Bio
      5. 

Geographical info schemas:
Might populate these directly in Supabase, rather than through Phoenix. There may be existing csv that I can import and upload directly.
`Note` might be better to use an API such as Google Maps API for this, so when more granular data is needed (such as cities, neighbourhoods etc) the database is not populated with redundant data that is available publicly.

1. #### __continents__:
  Contains Continent names

  Columns will include:

      1. id: primary key column (int type)
      2. name: varchar


2. #### __countries__:
  Contains Country names and ISD codes

  Columns will include:

      1. id: primary key column (int type)
      2. name: varchar 
      3. continent: links to __continent__ table through continent id


Many-to-many Relationship schemas:

#### __followers__:

  Columns will include:
  
      1. id: 
      2. user_id: the id of the user who is followed, foreign key relationship with __users__[id]
      3. follower_id: the id of the user who is following another user: foreign key relationship with __users__[id]
      4. date_followed: timestamp

#### __likes__:

####
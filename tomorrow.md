# Begin here:

1. getting an error in the migrations where `dineposts` could not be migrated since it references `places` which had not been created. Have moved the dineposts migrations file to a separate folder for now.
And gonna migrate till before the upvotes migration using this command `mix ecto.migrate --to 20211111185811`

__Fixed this__ Created a file 202111111190221_create_dineposts.exs before the create_upvotes and create_downvotes migrations file in priv/repo/migrations. Have copied content from the dineposts migration file that was created earlier.

2. Getting an error in migrated `areas_level_one` have uploaded a screenshot of the error. the error message is  `** (Postgrex.Error) ERROR 42703 (undefined_column) column "id" referenced in foreign key constraint does not exist`

__Fixed this__ Added `column: country_id` to the references call in the change function in the migration file for areas_level_one
## Documentation on creating the app

### Generating Authentication support

Used `mix phx.gen.auth Accounts User users` to create an Accounts context with a `User` module and `users` schema.

The default fields in the users schema are `email`, `password`, `hashed_password` and `confirmed_at`. Adding three new fields: `username`, `first_name` and `last_name`. Editing the following files:

In butterbeer/accounts - 
 - user.ex: added the following in schema 'users'
    ```
    field :first_name, :string, null: false
    field :last_name, :string, null: false
    field :username, :string, null: false
    ```

    In registration_changeset/3, added `:first_name, :last_name, :username` to the cast function, added validate_length for :username and validate_required for :first_name, :last_name and :username. (validate_required for :email and :password is already called in the validate_email and validate_password functions).

    Finally adding a unique_constraint for :email and :username

    This is the updated registration_changeset/3 function:
    ```
      def registration_changeset(user, attrs, opts \\ []) do
      user
      |> cast(attrs, [:email, :password, :first_name, :last_name, :username])
      |> validate_email()
      |> validate_password(opts)
      |> validate_required([:username, :first_name, :last_name])
      |> validate_length(:username, min: 2, max: 20)
      |> unique_constraint(:email, :username)
    end
    ```
    
 - user_notifier.ex
 - user_token.ex

In butterbeer - 
 - accounts.ex
## Generating Authentication support

Used `mix phx.gen.auth Accounts User users` to create an Accounts context with a `User` module and `users` schema.

The default fields in the users schema are `email`, `password`, `hashed_password` and `confirmed_at`. Adding three new fields: `username`, `first_name` and `last_name`. Editing the following files:

### In lib/butterbeer/accounts - 
 - user.ex: added the following in schema 'users'
    ```
    field :first_name, :string, null: false
    field :last_name, :string, null: false
    field :username, :string, null: false
    ```

    In registration_changeset/3, added `:first_name, :last_name, :username` to the cast function, added validate_length for :username and validate_required for :first_name, :last_name and :username. (validate_required for :email and :password is already called in the validate_email and validate_password functions).

    Finally adding a unique_constraint for :username (unique_constraint for :email is already called in validate_email)
    
 - user_notifier.ex - 
    Changed the arguments for the from/2 call in the private function deliver/3, the confirmation email template and password reset template.
    
    Old code:
    ```
    defp deliver(recipient, subject, body) do
      email =
        new()
        |> to(recipient)
        |> from({"MyApp", "contact@example.com"})
        |> subject(subject)
        |> text_body(body)

      with {:ok, _metadata} <- Mailer.deliver(email) do
        {:ok, email}
      end
    end

    @doc """
    Deliver instructions to confirm account.
    """
    def deliver_confirmation_instructions(user, url) do
    deliver(user.email, "Confirmation instructions", """

    ==============================

    Hi #{user.email},

    You can confirm your account by visiting the URL below:

    #{url}

    If you didn't create an account with us, please ignore this.

    ==============================
    """)
    end

    @doc """
    Deliver instructions to reset a user password.
    """
    def deliver_reset_password_instructions(user, url) do
    deliver(user.email, "Reset password instructions", """

    ==============================

    Hi #{user.email},

    You can reset your password by visiting the URL below:

    #{url}

    If you didn't request this change, please ignore this.

    ==============================
    """)
    end

    @doc """
    Deliver instructions to update a user email.
    """
    def deliver_update_email_instructions(user, url) do
    deliver(user.email, "Update email instructions", """

    ==============================

    Hi #{user.email},

    You can change your email by visiting the URL below:

    #{url}

    If you didn't request this change, please ignore this.

    ==============================
    """)
    end
    ```

 - user_token.ex - no changes made

### In lib/butterbeer - 
 - accounts.ex
    - Adding a get_user_by_username_and_password function similar to get_user_by_email_and_password

## In test/butterbeer - 

###  - In support/fixtures/accounts_fixtures.ex

Added attributes for :username, :first_name and :last_name

  Original code:
    ```
      def unique_user_email, do: "user#{System.unique_integer()}@example.com"
      def valid_user_password, do: "hello world!"

      def valid_user_attributes(attrs \\ %{}) do
        Enum.into(attrs, %{
          email: unique_user_email(),
          password: valid_user_password()
        })
      end

    ```

  #### In `accounts_test.exs`

  - Added function `describe "user_by_username_and_password"` to test `get_user_by_username_and_password/2`

  - Edited test  `describe "register_user/1"` - 
      - in test "requires email and password to be set" also added :username, :first_name and :last_name
      - added new test "validate username uniqueness"

    Original code:
  ```
  describe "register_user/1" do
    test "requires email and password to be set" do
      {:error, changeset} = Accounts.register_user(%{})

      assert %{
               password: ["can't be blank"],
               email: ["can't be blank"]
             } = errors_on(changeset)
    end

    test "validates email and password when given" do
      {:error, changeset} = Accounts.register_user(%{email: "not valid", password: "not valid"})

      assert %{
               email: ["must have the @ sign and no spaces"],
               password: ["should be at least 12 character(s)"]
             } = errors_on(changeset)
    end

    test "validates maximum values for email and password for security" do
      too_long = String.duplicate("db", 100)
      {:error, changeset} = Accounts.register_user(%{email: too_long, password: too_long})
      assert "should be at most 160 character(s)" in errors_on(changeset).email
      assert "should be at most 72 character(s)" in errors_on(changeset).password
    end

    test "validates email uniqueness" do
      %{email: email} = user_fixture()
      {:error, changeset} = Accounts.register_user(%{email: email})
      assert "has already been taken" in errors_on(changeset).email

      # Now try with the upper cased email too, to check that email case is ignored.
      {:error, changeset} = Accounts.register_user(%{email: String.upcase(email)})
      assert "has already been taken" in errors_on(changeset).email
    end

    test "registers users with a hashed password" do
      email = unique_user_email()
      {:ok, user} = Accounts.register_user(valid_user_attributes(email: email))
      assert user.email == email
      assert is_binary(user.hashed_password)
      assert is_nil(user.confirmed_at)
      assert is_nil(user.password)
    end
  end
  ```

### In butterbeer_web/controllers - 

#### ./user_auth_test.exs - no changes
#### ./user_confirmation_controller_test.exs - no changes
#### ./user_registration_controller_test.exs - no changes
#### ./user_reset_password_controller_test.exs - no changes
#### ./user_session_controller_test.exs - no changes
#### ./user_settings_controller_test.exs - no changes


## In lib/butterbeer_web/templates
## In ./layout/_user_menu.html.heex - 

Original code
```
<ul>
<%= if @current_user do %>
  <li><%= @current_user.email %></li>
  <li><%= link "Settings", to: Routes.user_settings_path(@conn, :edit) %></li>
  <li><%= link "Log out", to: Routes.user_session_path(@conn, :delete), method: :delete %></li>
<% else %>
  <li><%= link "Register", to: Routes.user_registration_path(@conn, :new) %></li>
  <li><%= link "Log in", to: Routes.user_session_path(@conn, :new) %></li>
<% end %>
</ul>

```
Replacing `@current_user.email` with `@current_user.username` in line 2


### In ./user_registration/new.html.heex

  Old code:

    ```
    <h1>Register</h1>

    <.form let={f} for={@changeset} action={Routes.user_registration_path(@conn, :create)}>
      <%= if @changeset.action do %>
        <div class="alert alert-danger">
          <p>Oops, something went wrong! Please check the errors below.</p>
        </div>
      <% end %>

      <%= label f, :email %>
      <%= email_input f, :email, required: true %>
      <%= error_tag f, :email %>

      <%= label f, :password %>
      <%= password_input f, :password, required: true %>
      <%= error_tag f, :password %>

      <div>
        <%= submit "Register" %>
      </div>
    </.form>

    <p>
      <%= link "Log in", to: Routes.user_session_path(@conn, :new) %> |
      <%= link "Forgot your password?", to: Routes.user_reset_password_path(@conn, :new) %>
    </p>
    ```
     - Adding fields for :username, :first_name and :last_name
     `Note:` to improve the template refer [Bootstrap forms](https://getbootstrap.com/docs/4.1/components/forms/)

### In ./user_confirmation - no changes in new.html.heex or edit.html.heex

### In ./user_reset_password - no changes in new.html.heex or edit.html.heex

### In ./user_session- no changes in new.html.heex
  `Note:` need to update later to accept :username or :email as login options

### In ./user_settings - no changes in edit.html.heex

## In lib/butterbeer_web/controllers

### In ./user_auth.ex - no changes

### In ./user_confirmation.ex - no changes

### In ./user_registration.ex - no changes

### In ./user_reset_password.ex - no changes

### In ./user_session_controller.ex - no changes

`Note:` needs to be edited later to allow login with username and emails

### In ./user_settings_controller.ex - no changes

## In lib/butterbeer_web/views - 

### In ./user_confirmation_view.ex - no changes
### In ./user_registration_view.ex - no changes
### In ./user_reset_password_view.ex - no changes
### In ./user_session_view.ex - no changes
### In ./user_settings_view.ex - no changes

## In lib/butterbeer_web/router.ex - no changes

## Editing migration file in butterbeer/priv/migrations

Original code:
```
defmodule Butterbeer.Repo.Migrations.CreateUsersAuthTables do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:users) do
      add :email, :citext, null: false
      add :hashed_password, :string, null: false
      add :confirmed_at, :naive_datetime
      timestamps()
    end

    create unique_index(:users, [:email])

    create table(:users_tokens) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :token, :binary, null: false
      add :context, :string, null: false
      add :sent_to, :string
      timestamps(updated_at: false)
    end

    create index(:users_tokens, [:user_id])
    create unique_index(:users_tokens, [:context, :token])
  end
end

```

Commenting out the line to `execute "CREATE EXTENSION IF NOT EXISTS citext", ""` as 'citext' has been enabled as an extension directly in the Supabase UI.

Also, creating unique_index with :username, instead of :email

Migrating with `mix ecto.migrate`
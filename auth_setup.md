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

    Finally adding a unique_constraint for :username (unique_constraint for :email is already called in validate_email)

    This is the updated registration_changeset/3 function:
    ```
      def registration_changeset(user, attrs, opts \\ []) do
      user
      |> cast(attrs, [:email, :password, :first_name, :last_name, :username])
      |> validate_email()
      |> validate_password(opts)
      |> validate_required([:username, :first_name, :last_name])
      |> validate_length(:username, min: 2, max: 20)
      |> unique_constraint(:username)
    end

    ```
    
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

    Updated code:

    ```
    @doc """
    Deliver instructions to confirm account.
    """
    def deliver_confirmation_instructions(user, url) do
    deliver(user.email, "Confirmation instructions", """

    ==============================

    Hi #{user.first_name},

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

    Hi #{user.first_name},

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

    Hi #{user.first_name},

    You can change your email by visiting the URL below:

    #{url}

    If you didn't request this change, please ignore this.

    ==============================
    """)
    end
    ```

 - user_token.ex - no changes made

In butterbeer - 
 - accounts.ex
    Adding a get_user_by_username_and_password function
    
    ```
    @doc """
    Gets a user by username and password.

    ## Examples

        iex> get_user_by_username_and_password("bb_admin", "correct_password")
        %User{}

        iex> get_user_by_username_and_password("bb_admin", "invalid_password")
        nil

    """
    def get_user_by_username_and_password(username, password)
        when is_binary(username) and is_binary(password) do
      user = Repo.get_by(User, username: username)
      if User.valid_password?(user, password), do: user
    end
    ```
defmodule Butterbeer.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Butterbeer.Accounts` context.
  """

  def unique_user_email, do: "user#{System.unique_integer([:positive])}@example.com"
  def valid_user_password, do: "hello world!"
  def unique_user_username, do: "user#{System.unique_integer([:positive])}"
  def valid_first_name, do: "global"
  def valid_last_name, do: "chef"

  def valid_user_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      email: unique_user_email(),
      password: valid_user_password(),
      username: unique_user_username(),
      first_name: valid_first_name(),
      last_name: valid_last_name(),
    })
  end

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> valid_user_attributes()
      |> Butterbeer.Accounts.register_user()

    user
  end

  def extract_user_token(fun) do
    {:ok, captured_email} = fun.(&"[TOKEN]#{&1}[TOKEN]")
    [_, token | _] = String.split(captured_email.text_body, "[TOKEN]")
    token
  end
end

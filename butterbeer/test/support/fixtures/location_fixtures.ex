defmodule Butterbeer.LocationFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Butterbeer.Location` context.
  """

  @doc """
  Generate a admin_area_one.
  """
  def admin_area_one_fixture(attrs \\ %{}) do
    {:ok, admin_area_one} =
      attrs
      |> Enum.into(%{
        long_name: "some long_name",
        short_name: "some short_name"
      })
      |> Butterbeer.Location.create_admin_area_one()

    admin_area_one
  end
end

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

  @doc """
  Generate a admin_area_two.
  """
  def admin_area_two_fixture(attrs \\ %{}) do
    {:ok, admin_area_two} =
      attrs
      |> Enum.into(%{
        long_name: "some long_name",
        short_name: "some short_name"
      })
      |> Butterbeer.Location.create_admin_area_two()

    admin_area_two
  end

  @doc """
  Generate a locality.
  """
  def locality_fixture(attrs \\ %{}) do
    {:ok, locality} =
      attrs
      |> Enum.into(%{
        long_name: "some long_name",
        short_name: "some short_name"
      })
      |> Butterbeer.Location.create_locality()

    locality
  end

  @doc """
  Generate a neighborhood.
  """
  def neighborhood_fixture(attrs \\ %{}) do
    {:ok, neighborhood} =
      attrs
      |> Enum.into(%{
        long_name: "some long_name",
        short_name: "some short_name"
      })
      |> Butterbeer.Location.create_neighborhood()

    neighborhood
  end

  @doc """
  Generate a place.
  """
  def place_fixture(attrs \\ %{}) do
    {:ok, place} =
      attrs
      |> Enum.into(%{
        google_maps_link: "some google_maps_link",
        name: "some name",
        url: "some url"
      })
      |> Butterbeer.Location.create_place()

    place
  end
end

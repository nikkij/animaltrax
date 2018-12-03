defmodule Animaltrax.Kennel do
  @moduledoc """
  The Kennel context.
  """

  import Ecto.Query, warn: false
  alias Animaltrax.Repo

  alias Animaltrax.Kennel.Animal

  @doc """
  Returns the list of animals.

  ## Examples

      iex> list_animals()
      [%Animal{}, ...]

  """
  def list_animals do
    raise "TODO"
  end

  @doc """
  Gets a single animal.

  Raises if the Animal does not exist.

  ## Examples

      iex> get_animal!(123)
      %Animal{}

  """
  def get_animal!(id), do: raise "TODO"

  @doc """
  Creates a animal.

  ## Examples

      iex> create_animal(%{field: value})
      {:ok, %Animal{}}

      iex> create_animal(%{field: bad_value})
      {:error, ...}

  """
  def create_animal(attrs \\ %{}) do
      %Animal{}
      |> Animal.changeset(attrs)
      |> Repo.insert()
  end

  @doc """
  Updates a animal.

  ## Examples

      iex> update_animal(animal, %{field: new_value})
      {:ok, %Animal{}}

      iex> update_animal(animal, %{field: bad_value})
      {:error, ...}

  """
  def update_animal(%Animal{} = animal, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a Animal.

  ## Examples

      iex> delete_animal(animal)
      {:ok, %Animal{}}

      iex> delete_animal(animal)
      {:error, ...}

  """
  def delete_animal(%Animal{} = animal) do
    raise "TODO"
  end

  @doc """
  Returns a datastructure for tracking animal changes.

  ## Examples

      iex> change_animal(animal)
      %Todo{...}

  """
  def change_animal(%Animal{} = animal) do
    raise "TODO"
  end
end

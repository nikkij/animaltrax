defmodule Animaltrax.Kennel.Animal do
  use Ecto.Schema
  import Ecto.Changeset


  schema "animals" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(animal, attrs) do
    animal
    |> cast(attrs, [:name])

  end
end

defmodule Animaltrax.Repo.Migrations.AddAnimals do
  use Ecto.Migration

  def change do
    create table(:animals) do
      add :name, :string

      timestamps()
    end
  end
end

defmodule Animaltrax.KennelTest do
  use Animaltrax.DataCase

  alias Animaltrax.Kennel

  describe "animals" do
    alias Animaltrax.Kennel.Animal

    @valid_attrs %{"name--no-context": "some name--no-context"}
    @update_attrs %{"name--no-context": "some updated name--no-context"}
    @invalid_attrs %{"name--no-context": nil}

    def animal_fixture(attrs \\ %{}) do
      {:ok, animal} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Kennel.create_animal()

      animal
    end

    test "list_animals/0 returns all animals" do
      animal = animal_fixture()
      assert Kennel.list_animals() == [animal]
    end

    test "get_animal!/1 returns the animal with given id" do
      animal = animal_fixture()
      assert Kennel.get_animal!(animal.id) == animal
    end

    test "create_animal/1 with valid data creates a animal" do
      assert {:ok, %Animal{} = animal} = Kennel.create_animal(@valid_attrs)
      assert animal.name--no-context == "some name--no-context"
    end

    test "create_animal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Kennel.create_animal(@invalid_attrs)
    end

    test "update_animal/2 with valid data updates the animal" do
      animal = animal_fixture()
      assert {:ok, animal} = Kennel.update_animal(animal, @update_attrs)
      assert %Animal{} = animal
      assert animal.name--no-context == "some updated name--no-context"
    end

    test "update_animal/2 with invalid data returns error changeset" do
      animal = animal_fixture()
      assert {:error, %Ecto.Changeset{}} = Kennel.update_animal(animal, @invalid_attrs)
      assert animal == Kennel.get_animal!(animal.id)
    end

    test "delete_animal/1 deletes the animal" do
      animal = animal_fixture()
      assert {:ok, %Animal{}} = Kennel.delete_animal(animal)
      assert_raise Ecto.NoResultsError, fn -> Kennel.get_animal!(animal.id) end
    end

    test "change_animal/1 returns a animal changeset" do
      animal = animal_fixture()
      assert %Ecto.Changeset{} = Kennel.change_animal(animal)
    end
  end
end

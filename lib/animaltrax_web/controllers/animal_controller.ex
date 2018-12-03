defmodule AnimaltraxWeb.AnimalController do
  use AnimaltraxWeb, :controller

  alias Animaltrax.Kennel
  alias Animaltrax.Kennel.Animal

  action_fallback AnimaltraxWeb.FallbackController

  def index(conn, _params) do
    animals = Kennel.list_animals()
    render(conn, "index.json", animals: animals)
  end

  def create(conn, %{"animal" => animal_params}) do
    with {:ok, %Animal{} = animal} <- Kennel.create_animal(animal_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", animal_path(conn, :show, animal))
      |> render("show.json", animal: animal)
    end
  end

  def show(conn, %{"id" => id}) do
    animal = Kennel.get_animal!(id)
    render(conn, "show.json", animal: animal)
  end

  def update(conn, %{"id" => id, "animal" => animal_params}) do
    animal = Kennel.get_animal!(id)

    with {:ok, %Animal{} = animal} <- Kennel.update_animal(animal, animal_params) do
      render(conn, "show.json", animal: animal)
    end
  end

  def delete(conn, %{"id" => id}) do
    animal = Kennel.get_animal!(id)
    with {:ok, %Animal{}} <- Kennel.delete_animal(animal) do
      send_resp(conn, :no_content, "")
    end
  end
end

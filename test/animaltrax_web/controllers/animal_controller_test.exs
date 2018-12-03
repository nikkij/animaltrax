defmodule AnimaltraxWeb.AnimalControllerTest do
  use AnimaltraxWeb.ConnCase

  alias Animaltrax.Kennel
  alias Animaltrax.Kennel.Animal

  @create_attrs %{"name--no-context": "some name--no-context"}
  @update_attrs %{"name--no-context": "some updated name--no-context"}
  @invalid_attrs %{"name--no-context": nil}

  def fixture(:animal) do
    {:ok, animal} = Kennel.create_animal(@create_attrs)
    animal
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all animals", %{conn: conn} do
      conn = get conn, animal_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create animal" do
    test "renders animal when data is valid", %{conn: conn} do
      conn = post conn, animal_path(conn, :create), animal: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, animal_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name--no-context" => "some name--no-context"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, animal_path(conn, :create), animal: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update animal" do
    setup [:create_animal]

    test "renders animal when data is valid", %{conn: conn, animal: %Animal{id: id} = animal} do
      conn = put conn, animal_path(conn, :update, animal), animal: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, animal_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name--no-context" => "some updated name--no-context"}
    end

    test "renders errors when data is invalid", %{conn: conn, animal: animal} do
      conn = put conn, animal_path(conn, :update, animal), animal: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete animal" do
    setup [:create_animal]

    test "deletes chosen animal", %{conn: conn, animal: animal} do
      conn = delete conn, animal_path(conn, :delete, animal)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, animal_path(conn, :show, animal)
      end
    end
  end

  defp create_animal(_) do
    animal = fixture(:animal)
    {:ok, animal: animal}
  end
end

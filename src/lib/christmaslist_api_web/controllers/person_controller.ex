defmodule ChristmaslistApi.PersonController do
  use ChristmaslistApiWeb, :controller

  alias ChristmaslistApiWeb.Person
  alias ChristmaslistApi.Repo

  def index(conn, _params) do
    persons = Repo.all(Person)
    json conn, persons
  end

  def create(conn, %{"person" => person_params}) do
    changeset = Person.changeset(%Person{}, person_params)

    case Repo.insert(changeset) do
      {:ok, person} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", person_path(conn, :show, person))
        |> json(person)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    person = Repo.get!(Person, id)

    json conn, person
  end

  def update(conn, %{"id" => id, "person" => person_params}) do
    person = Repo.get!(Person, id)
    changeset = Person.changeset(person, person_params)

    case Repo.update(changeset) do
      {:ok, person} ->
        json conn, person
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    person = Repo.get!(Person, id)

    Repo.delete!(person)

    send_resp(conn, :no_content, "")
  end
end

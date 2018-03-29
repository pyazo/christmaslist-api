defmodule ChristmaslistApiWeb.PersonController do
  use ChristmaslistApiWeb, :controller

  alias ChristmaslistApi.Repo
  alias ChristmaslistApiWeb.Person

  def list(conn, _params) do
    people = Repo.all(Person)

    json conn, people
  end

  def getById(conn, %{"id" => id}) do
    person = Repo.get(Person, String.to_integer(id))

    json conn, person
  end
end

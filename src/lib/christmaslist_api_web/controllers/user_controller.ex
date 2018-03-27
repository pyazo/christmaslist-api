defmodule ChristmaslistApiWeb.UserController do
  use ChristmaslistApiWeb, :controller

  alias ChristmaslistApi.Repo
  alias ChristmaslistApiWeb.User

  def list(conn, _params) do
    users = Repo.all(User)
    json conn, users
  end

  def getById(conn, %{"id" => id}) do
    user = Repo.get(User, String.to_integer(id))

    json conn, user
  end
end

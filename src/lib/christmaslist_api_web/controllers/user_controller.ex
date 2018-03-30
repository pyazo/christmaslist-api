defmodule ChristmaslistApi.UserController do
  use ChristmaslistApiWeb, :controller

  alias ChristmaslistApiWeb.User
  alias ChristmaslistApi.Repo

  def index(conn, _params) do
    users = Repo.all(User)
    json conn, users
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", user_path(conn, :show, user))
        |> json(user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)

    json conn, user
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Repo.get!(User, id)
    changeset = User.changeset(user, user_params)

    case Repo.update(changeset) do
      {:ok, user} ->
        json conn, user
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Repo.get!(User, id)

    Repo.delete!(user)

    send_resp(conn, :no_content, "")
  end
end

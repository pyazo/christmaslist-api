defmodule ChristmaslistApiWeb.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias ChristmaslistApiWeb.User

  schema "users" do
    field :auth0Token, :string
    field :firstName, :string
    field :lastName, :string
    field :email, :string

    timestamps
  end
end

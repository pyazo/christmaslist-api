defmodule ChristmaslistApiWeb.User do
  use Ecto.Schema

  alias ChristmaslistApiWeb.Person

  schema "users" do
    field :auth0Token, :string
    field :firstName, :string, size: 50
    field :lastName, :string, size: 50
    field :email, :string, size: 50
    field :isPremium, :boolean

    has_many :people, Person

    timestamps()
  end
end

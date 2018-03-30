defmodule ChristmaslistApiWeb.User do
  use Ecto.Schema
  import Ecto.Changeset

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

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:auth0Token, :firstName, :lastName, :email, :isPremium])
    |> validate_required([:auth0Token, :firstName, :lastName, :email, :isPremium])
  end
end

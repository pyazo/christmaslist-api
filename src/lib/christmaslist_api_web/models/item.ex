defmodule ChristmaslistApiWeb.Item do
  use Ecto.Schema
  import Ecto.Changeset

  alias ChristmaslistApiWeb.Person

  schema "items" do
    field :name, :string
    field :checked, :boolean, default: false, null: false

    belongs_to :person, Person

    timestamps()
  end

  def changeset(strict, params \\ %{}) do
    struct
    |> cast(params, [:name, :checked])
    |> validate_required([:name, :checked])
  end
end

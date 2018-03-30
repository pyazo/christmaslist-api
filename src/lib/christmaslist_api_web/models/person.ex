defmodule ChristmaslistApiWeb.Person do
  use Ecto.Schema
  import Ecto.Changeset

  alias ChristmaslistApiWeb.Item

  schema "people" do
    field :name, :string, size: 100
    field :shirtSize, :string, size: 50
    field :shoeSize, :string, size: 50
    field :pantsSize, :string, size: 50
    field :jacketSize, :string, size: 50

    has_many :items, Item

    timestamps()
  end

  def changeset(strict, params \\ %{}) do
    struct
    |> cast(params, [:name, :shirtSize, :shoeSize, :pantsSize, :jacketSize])
    |> validate_required([:name, :shirtSize, :shoeSize, :pantsSize, :jacketSize])
  end
end

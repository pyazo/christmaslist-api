defmodule ChristmaslistApiWeb.Person do
  use Ecto.Schema

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
end

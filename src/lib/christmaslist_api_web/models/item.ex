defmodule ChristmaslistApiWeb.Item do
  use Ecto.Schema

  alias ChristmaslistApiWeb.Person

  schema "items" do
    field :name, :string
    field :checked, :boolean

    belongs_to :person, Person

    timestamps()
  end
end

defmodule ChristmaslistApi.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table("people") do
      add :name, :string, size: 100
      add :shirtSize, :string, size: 50
      add :shoeSize, :string, size: 50
      add :pantsSize, :string, size: 50
      add :jacketSize, :string, size: 50

      add :user_id, references(:users)

      timestamps()
    end
  end
end

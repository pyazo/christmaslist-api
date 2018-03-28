defmodule ChristmaslistApi.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table("items") do
      add :name, :string
      add :checked, :boolean

      add :person_id, references(:people)

      timestamps()
    end
  end
end

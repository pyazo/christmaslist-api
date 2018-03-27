defmodule ChristmaslistApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table("users") do
      add :auth0Token, :string
      add :firstName, :string, size: 50
      add :lastName, :string, size: 50
      add :email, :string, size: 50

      timestamps
    end
  end
end

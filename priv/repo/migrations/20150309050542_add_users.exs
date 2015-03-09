defmodule Cooking.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string, size: 50
      add :last_name, :string, size: 50

      timestamps
    end
  end

end

defmodule Cooking.Repo.Migrations.AddEmailAndHashedPasswordToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :email, :string, size: 50
      add :hashed_password, :string, size: 200
    end
  end
end

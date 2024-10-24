defmodule App2.Repo.Migrations.CreateSenhas do
  use Ecto.Migration

  def change do
    create table(:senhas) do
      add :nome, :string
      add :email, :string
      add :senha, :string

      timestamps(type: :utc_datetime)
    end
  end
end

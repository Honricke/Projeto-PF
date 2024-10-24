defmodule App2.Gerenciador.Senha do
  use Ecto.Schema
  import Ecto.Changeset

  schema "senhas" do
    field :nome, :string
    field :email, :string
    field :senha, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(senha, attrs) do
    senha
    |> cast(attrs, [:nome, :email, :senha])
    |> validate_required([:nome, :email, :senha])
  end
end

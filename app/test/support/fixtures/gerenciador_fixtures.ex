defmodule App2.GerenciadorFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App2.Gerenciador` context.
  """

  @doc """
  Generate a senha.
  """
  def senha_fixture(attrs \\ %{}) do
    {:ok, senha} =
      attrs
      |> Enum.into(%{
        email: "some email",
        nome: "some nome",
        senha: "some senha"
      })
      |> App2.Gerenciador.create_senha()

    senha
  end
end

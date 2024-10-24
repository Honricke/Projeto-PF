defmodule App2.Gerenciador do
  @moduledoc """
  The Gerenciador context.
  """

  import Ecto.Query, warn: false
  alias App2.Repo

  alias App2.Gerenciador.Senha

  @doc """
  Returns the list of senhas.

  ## Examples

      iex> list_senhas()
      [%Senha{}, ...]

  """
  def list_senhas do
    Repo.all(Senha)
  end

  @doc """
  Gets a single senha.

  Raises `Ecto.NoResultsError` if the Senha does not exist.

  ## Examples

      iex> get_senha!(123)
      %Senha{}

      iex> get_senha!(456)
      ** (Ecto.NoResultsError)

  """
  def get_senha!(id), do: Repo.get!(Senha, id)

  @doc """
  Creates a senha.

  ## Examples

      iex> create_senha(%{field: value})
      {:ok, %Senha{}}

      iex> create_senha(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_senha(attrs \\ %{}) do
    %Senha{}
    |> Senha.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a senha.

  ## Examples

      iex> update_senha(senha, %{field: new_value})
      {:ok, %Senha{}}

      iex> update_senha(senha, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_senha(%Senha{} = senha, attrs) do
    senha
    |> Senha.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a senha.

  ## Examples

      iex> delete_senha(senha)
      {:ok, %Senha{}}

      iex> delete_senha(senha)
      {:error, %Ecto.Changeset{}}

  """
  def delete_senha(%Senha{} = senha) do
    Repo.delete(senha)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking senha changes.

  ## Examples

      iex> change_senha(senha)
      %Ecto.Changeset{data: %Senha{}}

  """
  def change_senha(%Senha{} = senha, attrs \\ %{}) do
    Senha.changeset(senha, attrs)
  end
end

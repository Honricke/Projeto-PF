defmodule App2Web.SenhaController do
  use App2Web, :controller

  alias App2.Gerenciador
  alias App2.Gerenciador.Senha

  def index(conn, _params) do
    senhas = Gerenciador.list_senhas()
    render(conn, :index, senhas: senhas)
  end

  def new(conn, _params) do
    changeset = Gerenciador.change_senha(%Senha{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"senha" => senha_params}) do
    case Gerenciador.create_senha(senha_params) do
      {:ok, senha} ->
        conn
        |> put_flash(:info, "Senha created successfully.")
        |> redirect(to: ~p"/senhas/#{senha}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    senha = Gerenciador.get_senha!(id)
    render(conn, :show, senha: senha)
  end

  def edit(conn, %{"id" => id}) do
    senha = Gerenciador.get_senha!(id)
    changeset = Gerenciador.change_senha(senha)
    render(conn, :edit, senha: senha, changeset: changeset)
  end

  def update(conn, %{"id" => id, "senha" => senha_params}) do
    senha = Gerenciador.get_senha!(id)

    case Gerenciador.update_senha(senha, senha_params) do
      {:ok, senha} ->
        conn
        |> put_flash(:info, "Senha updated successfully.")
        |> redirect(to: ~p"/senhas/#{senha}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, senha: senha, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    senha = Gerenciador.get_senha!(id)
    {:ok, _senha} = Gerenciador.delete_senha(senha)

    conn
    |> put_flash(:info, "Senha deleted successfully.")
    |> redirect(to: ~p"/senhas")
  end
end

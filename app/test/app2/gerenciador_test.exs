defmodule App2.GerenciadorTest do
  use App2.DataCase

  alias App2.Gerenciador

  describe "senhas" do
    alias App2.Gerenciador.Senha

    import App2.GerenciadorFixtures

    @invalid_attrs %{nome: nil, email: nil, senha: nil}

    test "list_senhas/0 returns all senhas" do
      senha = senha_fixture()
      assert Gerenciador.list_senhas() == [senha]
    end

    test "get_senha!/1 returns the senha with given id" do
      senha = senha_fixture()
      assert Gerenciador.get_senha!(senha.id) == senha
    end

    test "create_senha/1 with valid data creates a senha" do
      valid_attrs = %{nome: "some nome", email: "some email", senha: "some senha"}

      assert {:ok, %Senha{} = senha} = Gerenciador.create_senha(valid_attrs)
      assert senha.nome == "some nome"
      assert senha.email == "some email"
      assert senha.senha == "some senha"
    end

    test "create_senha/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gerenciador.create_senha(@invalid_attrs)
    end

    test "update_senha/2 with valid data updates the senha" do
      senha = senha_fixture()
      update_attrs = %{nome: "some updated nome", email: "some updated email", senha: "some updated senha"}

      assert {:ok, %Senha{} = senha} = Gerenciador.update_senha(senha, update_attrs)
      assert senha.nome == "some updated nome"
      assert senha.email == "some updated email"
      assert senha.senha == "some updated senha"
    end

    test "update_senha/2 with invalid data returns error changeset" do
      senha = senha_fixture()
      assert {:error, %Ecto.Changeset{}} = Gerenciador.update_senha(senha, @invalid_attrs)
      assert senha == Gerenciador.get_senha!(senha.id)
    end

    test "delete_senha/1 deletes the senha" do
      senha = senha_fixture()
      assert {:ok, %Senha{}} = Gerenciador.delete_senha(senha)
      assert_raise Ecto.NoResultsError, fn -> Gerenciador.get_senha!(senha.id) end
    end

    test "change_senha/1 returns a senha changeset" do
      senha = senha_fixture()
      assert %Ecto.Changeset{} = Gerenciador.change_senha(senha)
    end
  end
end

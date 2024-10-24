defmodule App2Web.SenhaControllerTest do
  use App2Web.ConnCase

  import App2.GerenciadorFixtures

  @create_attrs %{nome: "some nome", email: "some email", senha: "some senha"}
  @update_attrs %{nome: "some updated nome", email: "some updated email", senha: "some updated senha"}
  @invalid_attrs %{nome: nil, email: nil, senha: nil}

  describe "index" do
    test "lists all senhas", %{conn: conn} do
      conn = get(conn, ~p"/senhas")
      assert html_response(conn, 200) =~ "Listing Senhas"
    end
  end

  describe "new senha" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/senhas/new")
      assert html_response(conn, 200) =~ "New Senha"
    end
  end

  describe "create senha" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/senhas", senha: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/senhas/#{id}"

      conn = get(conn, ~p"/senhas/#{id}")
      assert html_response(conn, 200) =~ "Senha #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/senhas", senha: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Senha"
    end
  end

  describe "edit senha" do
    setup [:create_senha]

    test "renders form for editing chosen senha", %{conn: conn, senha: senha} do
      conn = get(conn, ~p"/senhas/#{senha}/edit")
      assert html_response(conn, 200) =~ "Edit Senha"
    end
  end

  describe "update senha" do
    setup [:create_senha]

    test "redirects when data is valid", %{conn: conn, senha: senha} do
      conn = put(conn, ~p"/senhas/#{senha}", senha: @update_attrs)
      assert redirected_to(conn) == ~p"/senhas/#{senha}"

      conn = get(conn, ~p"/senhas/#{senha}")
      assert html_response(conn, 200) =~ "some updated nome"
    end

    test "renders errors when data is invalid", %{conn: conn, senha: senha} do
      conn = put(conn, ~p"/senhas/#{senha}", senha: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Senha"
    end
  end

  describe "delete senha" do
    setup [:create_senha]

    test "deletes chosen senha", %{conn: conn, senha: senha} do
      conn = delete(conn, ~p"/senhas/#{senha}")
      assert redirected_to(conn) == ~p"/senhas"

      assert_error_sent 404, fn ->
        get(conn, ~p"/senhas/#{senha}")
      end
    end
  end

  defp create_senha(_) do
    senha = senha_fixture()
    %{senha: senha}
  end
end

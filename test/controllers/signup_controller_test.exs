defmodule LightningTalks.SignupControllerTest do
  use LightningTalks.ConnCase

  alias LightningTalks.Signup
  @valid_attrs %{description: "some content", name: "some content", topic: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, signup_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing signup"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, signup_path(conn, :new)
    assert html_response(conn, 200) =~ "New signup"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, signup_path(conn, :create), signup: @valid_attrs
    assert redirected_to(conn) == signup_path(conn, :index)
    assert Repo.get_by(Signup, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, signup_path(conn, :create), signup: @invalid_attrs
    assert html_response(conn, 200) =~ "New signup"
  end

  test "shows chosen resource", %{conn: conn} do
    signup = Repo.insert! %Signup{}
    conn = get conn, signup_path(conn, :show, signup)
    assert html_response(conn, 200) =~ "Show signup"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, signup_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    signup = Repo.insert! %Signup{}
    conn = get conn, signup_path(conn, :edit, signup)
    assert html_response(conn, 200) =~ "Edit signup"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    signup = Repo.insert! %Signup{}
    conn = put conn, signup_path(conn, :update, signup), signup: @valid_attrs
    assert redirected_to(conn) == signup_path(conn, :show, signup)
    assert Repo.get_by(Signup, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    signup = Repo.insert! %Signup{}
    conn = put conn, signup_path(conn, :update, signup), signup: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit signup"
  end

  test "deletes chosen resource", %{conn: conn} do
    signup = Repo.insert! %Signup{}
    conn = delete conn, signup_path(conn, :delete, signup)
    assert redirected_to(conn) == signup_path(conn, :index)
    refute Repo.get(Signup, signup.id)
  end
end

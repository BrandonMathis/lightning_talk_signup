defmodule LightningTalks.SignupController do
  use LightningTalks.Web, :controller

  alias LightningTalks.Signup

  plug :scrub_params, "signup" when action in [:create, :update]

  def index(conn, _params) do
    signup = Repo.all(Signup)
    render(conn, "index.html", signup: signup)
  end

  def new(conn, _params) do
    changeset = Signup.changeset(%Signup{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"signup" => signup_params}) do
    changeset = Signup.changeset(%Signup{}, signup_params)

    case Repo.insert(changeset) do
      {:ok, _signup} ->
        conn
        |> put_flash(:info, "Signup created successfully.")
        |> redirect(to: signup_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end

defmodule LightningTalks.Router do
  use LightningTalks.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LightningTalks do
    pipe_through :browser # Use the default browser stack

    resources "/signup", SignupController, only: [:index, :new, :create]
    get "/", SignupController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", LightningTalks do
  #   pipe_through :api
  # end
end

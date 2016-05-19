defmodule LightningTalks.PageController do
  use LightningTalks.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

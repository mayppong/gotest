defmodule GotestWeb.PageController do
  use GotestWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

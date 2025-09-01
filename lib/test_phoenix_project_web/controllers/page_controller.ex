defmodule TestPhoenixProjectWeb.PageController do
  use TestPhoenixProjectWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end

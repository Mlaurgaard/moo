defmodule MooWeb.TesttableController do
  use MooWeb, :controller

  import Ecto.Query, warn: false
  alias Moo.Repo

  alias Moo.Identity
  alias Moo.Identity.User
  alias Moo.Identity.Adress



  def index(conn, _params) do
    users = Identity.list_users()
    adresses = Identity.list_adresses()
    render(conn, "index.html", users: users, adresses: adresses)
  end

  def show(conn, %{"id" => id}) do
    user = Identity.get_user!(id)
    adress = Identity.get_adress!(id)
    render(conn, "show.html", user: user, adress: adress)
  end


 end

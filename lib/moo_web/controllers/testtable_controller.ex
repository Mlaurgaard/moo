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

  def new(conn, _params) do
    changeset = User.changeset(%User{adress: [%Adress{}]})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
    case Repo.insert(changeset) do
      {:ok, user} ->
        adress = Enum.at(user.adress, 0) |> Repo.preload(:user)
        conn
        |> redirect(to: testtable_path(conn, :index))
      {:error, changeset} ->
    render(conn, "new.html", changeset: changeset)
    end
  end



 end

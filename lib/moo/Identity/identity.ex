defmodule Moo.Identity do

  import Ecto.Query, warn: false
  alias Moo.Repo

  alias Moo.Identity.User
  alias Moo.Identity.Adress

  def list_users do
    Repo.all(User)
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()

  end

  def get_user!(id), do: Repo.get!(User,id)


  def list_adresses do
    Repo.all(Adress)
  end

  def create_adress(attrs \\ %{}) do
    %Adress{}
    |> Adress.changeset(attrs)

  end

  def get_adress!(id), do: Repo.get!(Adress, id)

end

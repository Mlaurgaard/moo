defmodule Moo.Identity.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :fname, :string
    field :lname, :string
    field :phone, :string
    field :email, :string
    has_many :adress, Moo.Identity.Adress
    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> Moo.Repo.preload(:adress)
    |> cast(attrs, [:fname, :lname, :phone, :email])
    |> validate_required([:fname, :lname, :phone, :email])
    |> cast_assoc(:adress)
  end
end

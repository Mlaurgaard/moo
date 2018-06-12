defmodule Moo.Identity.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :fname, :string
    field :lname, :string
    field :phone, :string
    field :email, :string
    has_one :adresses, Moo.Identity.Adress
    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> Moo.Repo.preload(:adresses)
    |> cast_assoc(attrs, [:fname, :lname, :phone, :email, :adresses])
    |> Ecto.Changeset.cast_assoc(:adresses)
    |> validate_required([:fname, :lname, :phone, :email, :adresses])
  end
end

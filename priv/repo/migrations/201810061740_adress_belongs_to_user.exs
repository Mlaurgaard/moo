defmodule Moo.Repo.Migrations.AdressBelongsToUser do
  use Ecto.Migration

  def change do
    alter table(:adresses) do
      add :user_id, references(:users)
    end
  end
end

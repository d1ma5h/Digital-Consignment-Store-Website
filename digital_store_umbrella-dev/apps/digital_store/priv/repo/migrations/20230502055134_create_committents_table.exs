defmodule DS.Repo.Migrations.CreateCommittentsTable do
  use Ecto.Migration

  alias DS.Repository.Types.Status

  def change do
    create table(:committents) do
      add(:status, Status.type(), default: "active")
    end
  end
end

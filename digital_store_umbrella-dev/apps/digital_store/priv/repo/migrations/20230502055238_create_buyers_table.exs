defmodule DS.Repo.Migrations.CreateBuyersTable do
  use Ecto.Migration

  alias DS.Repository.Types.Status

  def change do
    create table(:buyers) do
      add(:status, Status.type(), default: "active")
    end
  end
end

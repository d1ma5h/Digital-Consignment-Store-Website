defmodule DS.Repo.Migrations.CreateDebtorsTable do
  use Ecto.Migration

  alias DS.Repository.Types.Status

  def change do
    create table(:debtors) do
      add(:status, Status.type(), default: "active")
    end
  end
end

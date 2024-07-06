defmodule DS.Repo.Migrations.CreateBlackListTable do
  use Ecto.Migration

  alias DS.Repository.Types.Status

  def change do
    create table(:black_list) do
      add(:reason_making, references(:reference_books), null: false)
      add(:reason_withdrawal, references(:reference_books), null: false)
      add(:status, Status.type(), default: "active")
    end
  end
end

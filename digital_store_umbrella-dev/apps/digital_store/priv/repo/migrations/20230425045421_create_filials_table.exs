defmodule DS.Repo.Migrations.CreateFilialsTable do
  use Ecto.Migration

  alias DS.Repository.Types.Status

  def change do
    create table(:filials) do
      add(:name, :string, null: false)
      add(:address, :string, null: false)
      add(:status, Status.type(), default: "active")
    end
  end
end

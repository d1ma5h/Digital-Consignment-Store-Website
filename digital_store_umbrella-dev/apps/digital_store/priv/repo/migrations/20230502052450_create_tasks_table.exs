defmodule DS.Repo.Migrations.CreateTasksTable do
  use Ecto.Migration

  alias DS.Repository.Types.Status

  def change do
    create table(:tasks) do
      add(:type, references(:reference_books), null: false)
      add(:create_date, :naive_datetime, null: false)
      add(:comment, :string, null: false)
      add(:close_date, :naive_datetime, null: false)
      add(:status, Status.type(), default: "active")
    end
  end
end

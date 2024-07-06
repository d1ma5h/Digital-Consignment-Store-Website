defmodule DS.Repo.Migrations.CreateWorkersTable do
  use Ecto.Migration

  alias DS.Repository.Types.{WorkerType, Status}

  def change do
    WorkerType.create_type()

    create table(:workers) do
      add(:role, WorkerType.type(), null: false)
      add(:status, Status.type(), default: "active")
    end
  end
end

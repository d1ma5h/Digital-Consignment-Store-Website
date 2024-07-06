defmodule DS.Repo.Migrations.CreateOrganizationsTable do
  use Ecto.Migration

  alias DS.Repository.Types.Status

  def change do
    create table(:organizations) do
      add(:bin, :string, null: false)
      add(:official_name, :string, null: false)
      add(:commercial_name, :string, null: false)
      add(:official_address, :json, null: false)
      add(:factual_address, :json, null: false)
      add(:head_user_id, :bigserial, null: false)
      add(:status, Status.type(), default: "active")
    end
  end
end

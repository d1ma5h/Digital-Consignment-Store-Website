defmodule DS.Repo.Migrations.CreateItemsTable do
  use Ecto.Migration

  alias DS.Repository.Types.Status

  def change do
    create table(:items) do
      add(:type, references(:reference_books), null: false)
      add(:name, :string, null: false)
      add(:weight, :float, null: false)
      add(:metal, references(:reference_books), null: false)
      add(:amount, :integer, null: false)
      add(:photo, :string, null: false)
      add(:condition, references(:reference_books), null: false)
      add(:sum, :float, null: false)
      add(:comment, :string, null: false)
      add(:status, Status.type(), default: "active")
    end
  end
end

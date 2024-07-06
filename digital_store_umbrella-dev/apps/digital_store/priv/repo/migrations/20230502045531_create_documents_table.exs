defmodule DS.Repo.Migrations.CreateDocumentsTable do
  use Ecto.Migration

  def change do
    create table(:documents) do
      add(:type, references(:reference_books), null: false)
      add(:downloaded_files, :string, null: false)
      add(:status, references(:reference_books), null: false)
    end
  end
end

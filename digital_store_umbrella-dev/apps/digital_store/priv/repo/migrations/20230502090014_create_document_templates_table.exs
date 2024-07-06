defmodule DS.Repo.Migrations.CreateDocumentTemplatesTable do
  use Ecto.Migration

  def change do
    create table(:document_templates) do
      add(:type, references(:reference_books), null: false)
      add(:downloaded_files, :string, null: false)
      add(:status, references(:reference_books), null: false)
    end
  end
end

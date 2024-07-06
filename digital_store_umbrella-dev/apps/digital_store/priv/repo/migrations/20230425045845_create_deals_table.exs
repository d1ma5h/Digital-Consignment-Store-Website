defmodule DS.Repo.Migrations.CreateDealsTable do
  use Ecto.Migration

  def change do
    create table(:deals) do
      add(:number, :integer, null: false)
      add(:name, :string, null: false)
      add(:operation_scheme, references(:reference_books), null: false)
      add(:create_date, :naive_datetime, null: false)
      add(:validity_day, :integer, null: false)
      add(:return_date, :naive_datetime, null: false)
      add(:percentage_for_operation, :float, null: false)
      add(:percentage_for_storage, :float, null: false)
      add(:percent_for_evaluation, :float, null: false)
      add(:contribution_sum, :float, null: false)
      add(:items_sum, :float, null: false)
      add(:status, references(:reference_books), null: false)
    end
  end
end

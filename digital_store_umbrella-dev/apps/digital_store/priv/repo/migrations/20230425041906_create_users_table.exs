defmodule DS.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  alias DS.Repository.Types.{UserType, Status}

  def change do

    UserType.create_type()
    Status.create_type()

    create table(:reference_books) do
      add(:type, :string, null: false)
      add(:title, :string, null: false)
      add(:parent_id, :bigserial, null: false)
      add(:entity, :string, null: false)
      add(:props, :json, null: false)
      add(:value, :string, null: false)
      add(:status, Status.type(), default: "active")
    end

    create table(:users) do
      add(:role, :string, null: false)
      add(:type, UserType.type(), null: false)
      add(:first_name, :string, null: false)
      add(:last_name, :string, null: false)
      add(:patronymic, :string, null: false)
      add(:birth_date, :date, null: false)
      add(:citizenship, references(:reference_books), null: false)
      add(:iin, :string, null: false)
      add(:certificate_number, :string, null: false)
      add(:certificate_issue_date, :date, null: false)
      add(:certificate_validity_date, :date, null: false)
      add(:address_official, :json, null: false)
      add(:address_living, :json, null: false)
      add(:job_place, :string, null: false)
      add(:job, :string, null: false)
      add(:salary, :int, null: false)
      add(:source_income, references(:reference_books), null: false)
      add(:phone_number, :string, null: false)
      add(:email, :string, null: false)
      add(:login, :string, null: false)
      add(:password, :string, null: false)
      add(:status, Status.type(), default: "active")
    end
  end
end

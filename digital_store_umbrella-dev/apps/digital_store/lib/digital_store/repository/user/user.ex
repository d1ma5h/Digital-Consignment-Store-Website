defmodule DS.Repository.User do
  use Ecto.Schema

  import Ecto.Changeset
  import EctoEnum

  alias Helper.ChangesetHelper

  defenum(Status, active: "active", passive: "passive", deleted: "deleted")
  defenum(UserType, natural: "natural", legal: "legal")

  schema "debtors" do
    field(:role, :string)
    field(:type, UserType)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:patronymic, :string)
    field(:birth_date, :date)
    field(:citizenship, :integer)
    field(:iin, :string)
    field(:certificate_number, :string)
    field(:certificate_issue_date, :date)
    field(:certificate_validity_date, :date)
    field(:address_official, :map)
    field(:address_living, :map)
    field(:job_place, :string)
    field(:job, :string)
    field(:salary, :integer)
    field(:source_income, :integer)
    field(:phone_number, :string)
    field(:email, :string)
    field(:login, :string)
    field(:password, :string)
    field(:status, Status)
  end

  use Helper.RepositoryHelper, repo: DS.Repo

  def changeset(obj, params \\ %{}) do
    obj
    |> cast(params, [
      :role,
      :type,
      :first_name,
      :last_name,
      :patronymic,
      :birth_date,
      :citizenship,
      :iin,
      :certificate_number,
      :certificate_issue_date,
      :certificate_validity_date,
      :address_official,
      :address_living,
      :job_place,
      :job,
      :salary,
      :source_income,
      :phone_number,
      :email,
      :login,
      :password,
      :status
    ])
    |> validate_required([
      :role,
      :type,
      :first_name,
      :last_name,
      :patronymic,
      :birth_date,
      :citizenship,
      :iin,
      :certificate_number,
      :certificate_issue_date,
      :certificate_validity_date,
      :address_official,
      :address_living,
      :job_place,
      :job,
      :salary,
      :source_income,
      :phone_number,
      :email,
      :login,
      :password,
      :status
    ])
    |> ChangesetHelper.enum_type_check(:status, Status)
    |> ChangesetHelper.enum_type_check(:type, UserType)
    |> foreign_key_constraint(:source_income)
    |> foreign_key_constraint(:citizenship)
  end
end

defmodule DS.Repository.Worker do
  use Ecto.Schema

  import Ecto.Changeset
  import EctoEnum

  alias Helper.ChangesetHelper

  defenum(Status, active: "active", passive: "passive", deleted: "deleted")
  defenum(WorkerType, owner_company: "owner_company", owner_organization: "owner_organization", admin_company: "admin_company", admin_organization: "admin_organization", operator_digital: "operator_digital", operator_service: "operator_service", collector: "collector", accountant: "accountant", super_admin: "super_admin", admin_system: "admin_system")

  schema "debtors" do
    field(:role, WorkerType)
    field(:status, Status)
  end

  use Helper.RepositoryHelper, repo: DS.Repo

  def changeset(obj, params \\ %{}) do
    obj
    |> cast(params, [
      :role,
      :status
    ])
    |> validate_required([
      :role,
      :status
    ])
    |> ChangesetHelper.enum_type_check(:status, Status)
    |> ChangesetHelper.enum_type_check(:role, WorkerType)
  end
end

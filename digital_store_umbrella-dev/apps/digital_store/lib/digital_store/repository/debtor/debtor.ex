defmodule DS.Repository.Debtor do
  use Ecto.Schema

  import Ecto.Changeset
  import EctoEnum

  alias Helper.ChangesetHelper

  defenum(Status, active: "active", passive: "passive", deleted: "deleted")

  schema "debtors" do
    field(:status, Status)
  end

  use Helper.RepositoryHelper, repo: DS.Repo

  def changeset(obj, params \\ %{}) do
    obj
    |> cast(params, [
      :status
    ])
    |> validate_required([
      :status
    ])
    |> ChangesetHelper.enum_type_check(:status, Status)
  end
end

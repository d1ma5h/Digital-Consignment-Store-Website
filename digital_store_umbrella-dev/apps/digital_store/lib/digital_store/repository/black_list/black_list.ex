defmodule DS.Repository.BlackList do
  use Ecto.Schema

  import Ecto.Changeset
  import EctoEnum

  alias Helper.ChangesetHelper

  defenum(Status, active: "active", passive: "passive", deleted: "deleted")

  schema "black_list" do
    field(:reason_making, :integer)
    field(:reason_withdrawal, :integer)
    field(:status, Status, default: :active)
  end

  use Helper.RepositoryHelper, repo: DS.Repo

  def changeset(obj, params \\ %{}) do
    obj
    |> cast(params, [
      :reason_making,
      :reason_withdrawal,
      :status
    ])
    |> validate_required([
      :reason_making,
      :reason_withdrawal,
      :status
    ])
    |> foreign_key_constraint(:reason_making)
    |> foreign_key_constraint(:reason_withdrawal)
    |> ChangesetHelper.enum_type_check(:status, Status)
  end
end

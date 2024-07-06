defmodule DS.Repository.Task do
  use Ecto.Schema

  import Ecto.Changeset
  import EctoEnum

  alias Helper.ChangesetHelper

  defenum(Status, active: "active", passive: "passive", deleted: "deleted")

  schema "debtors" do
    field(:type, :integer)
    field(:create_date, :naive_datetime)
    field(:comment, :string)
    field(:close_date, :naive_datetime)
    field(:status, Status)
  end

  use Helper.RepositoryHelper, repo: DS.Repo

  def changeset(obj, params \\ %{}) do
    obj
    |> cast(params, [
      :type,
      :create_date,
      :comment,
      :close_date,
      :status
    ])
    |> validate_required([
      :type,
      :create_date,
      :comment,
      :close_date,
      :status
    ])
    |> ChangesetHelper.enum_type_check(:status, Status)
    |> foreign_key_constraint(:type)
  end
end

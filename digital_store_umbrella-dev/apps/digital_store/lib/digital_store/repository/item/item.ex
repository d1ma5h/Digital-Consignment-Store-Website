defmodule DS.Repository.Item do
  use Ecto.Schema

  import Ecto.Changeset
  import EctoEnum

  alias Helper.ChangesetHelper

  defenum(Status, active: "active", passive: "passive", deleted: "deleted")

  schema "items" do
    field(:type, :integer)
    field(:name, :string)
    field(:weight, :float)
    field(:metal, :integer)
    field(:amount, :integer)
    field(:photo, :string)
    field(:confition, :integer)
    field(:sum, :float)
    field(:comment, :string)
    field(:status, Status)
  end

  use Helper.RepositoryHelper, repo: DS.Repo

  def changeset(obj, params \\ %{}) do
    obj
    |> cast(params, [
      :type,
      :name,
      :weight,
      :metal,
      :amount,
      :photo,
      :confition,
      :sum,
      :comment,
      :status
    ])
    |> validate_required([
      :type,
      :name,
      :weight,
      :metal,
      :amount,
      :photo,
      :confition,
      :sum,
      :comment,
      :status
    ])
    |> ChangesetHelper.enum_type_check(:status, Status)
    |> foreign_key_constraint(:type)
    |> foreign_key_constraint(:metal)
    |> foreign_key_constraint(:condition)
  end
end

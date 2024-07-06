defmodule DS.Repository.ReferenceBook do
  use Ecto.Schema

  import Ecto.Changeset
  import EctoEnum

  alias Helper.ChangesetHelper

  defenum(Status, active: "active", passive: "passive", deleted: "deleted")

  schema "reference_books" do
    field(:type, :string)
    field(:title, :string)
    field(:parent_id, :integer)
    field(:entity, :string)
    field(:props, :map)
    field(:value, :string)
    field(:status, Status)
  end

  use Helper.RepositoryHelper, repo: DS.Repo

  def changeset(obj, params \\ %{}) do
    obj
    |> cast(params, [
      :type,
      :title,
      :parent_id,
      :entity,
      :props,
      :value,
      :status
    ])
    |> validate_required([
      :type,
      :title,
      :parent_id,
      :entity,
      :props,
      :value,
      :status
    ])
    |> ChangesetHelper.enum_type_check(:status, Status)
  end
end

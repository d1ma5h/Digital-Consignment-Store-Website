defmodule DS.Repository.Filial do
  use Ecto.Schema

  import Ecto.Changeset
  import EctoEnum

  alias Helper.ChangesetHelper

  defenum(Status, active: "active", passive: "passive", deleted: "deleted")

  schema "filials" do
    field(:name, :string)
    field(:address, :string)
    field(:status, Status)
  end

  use Helper.RepositoryHelper, repo: DS.Repo

  def changeset(obj, params \\ %{}) do
    obj
    |> cast(params, [
      :name,
      :address,
      :status
    ])
    |> validate_required([
      :name,
      :address,
      :status
    ])
    |> ChangesetHelper.enum_type_check(:status, Status)
  end
end

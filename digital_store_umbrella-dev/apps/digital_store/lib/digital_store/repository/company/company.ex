defmodule DS.Repository.Company do
  use Ecto.Schema

  import Ecto.Changeset
  import EctoEnum

  alias Helper.ChangesetHelper

  defenum(Status, active: "active", passive: "passive", deleted: "deleted")

  schema "companies" do
    field(:bin, :string)
    field(:official_name, :string)
    field(:commercial_name, :string)
    field(:official_address, :map)
    field(:factual_address, :map)
    field(:head_user_id, :integer)
    field(:status, Status)
  end

  use Helper.RepositoryHelper, repo: DS.Repo

  def changeset(obj, params \\ %{}) do
    obj
    |> cast(params, [
      :bin,
      :official_name,
      :commercial_name,
      :official_address,
      :factual_address,
      :head_user_id,
      :status
    ])
    |> validate_required([
      :bin,
      :official_name,
      :commercial_name,
      :official_address,
      :factual_address,
      :head_user_id,
      :status
    ])
    |> ChangesetHelper.enum_type_check(:status, Status)
  end
end

defmodule DS.Repository.Document do
  use Ecto.Schema

  import Ecto.Changeset

  schema "documents" do
    field(:type, :integer)
    field(:downloaded_files, :string)
    field(:status, :integer)
  end

  use Helper.RepositoryHelper, repo: DS.Repo

  def changeset(obj, params \\ %{}) do
    obj
    |> cast(params, [
      :type,
      :downloaded_files,
      :status
    ])
    |> validate_required([
      :type,
      :downloaded_files,
      :status
    ])
    |> foreign_key_constraint(:status)
    |> foreign_key_constraint(:type)
  end
end

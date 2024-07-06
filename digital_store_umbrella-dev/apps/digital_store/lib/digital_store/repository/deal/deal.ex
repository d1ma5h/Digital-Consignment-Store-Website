defmodule DS.Repository.Deal do
  use Ecto.Schema

  import Ecto.Changeset

  schema "deals" do
    field(:number, :integer)
    field(:name, :string)
    field(:operation_scheme, :integer)
    field(:create_date, :naive_datetime)
    field(:validity_day, :integer)
    field(:return_date, :naive_datetime)
    field(:percentage_for_operation, :float)
    field(:percentage_for_storage, :float)
    field(:percent_for_evaluation, :float)
    field(:contribution_sum, :float)
    field(:items_sum, :float)
    field(:status, :integer)
  end

  use Helper.RepositoryHelper, repo: DS.Repo

  def changeset(obj, params \\ %{}) do
    obj
    |> cast(params, [
      :number,
      :name,
      :operation_scheme,
      :create_date,
      :validity_day,
      :return_date,
      :percentage_for_operation,
      :percentage_for_storage,
      :percent_for_evaluation,
      :contribution_sum,
      :items_sum,
      :status
    ])
    |> validate_required([
      :number,
      :name,
      :operation_scheme,
      :create_date,
      :validity_day,
      :return_date,
      :percentage_for_operation,
      :percentage_for_storage,
      :percent_for_evaluation,
      :contribution_sum,
      :items_sum,
      :status
    ])
    |> foreign_key_constraint(:status)
    |> foreign_key_constraint(:operation_scheme)
  end
end

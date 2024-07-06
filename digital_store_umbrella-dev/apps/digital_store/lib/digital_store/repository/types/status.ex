defmodule DS.Repository.Types.Status do
    use EctoEnum.Postgres,
      type: :status,
      enums: [:active, :passive, :deleted]

    @type type :: :active | :passive | :deleted
end

defmodule DS.Repository.Types.UserType do
  use EctoEnum.Postgres,
    type: :user_type,
    enums: [:natural, :legal]

  @type type :: :natural | :legal
end

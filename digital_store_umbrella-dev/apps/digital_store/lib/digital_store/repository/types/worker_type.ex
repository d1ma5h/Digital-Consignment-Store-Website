defmodule DS.Repository.Types.WorkerType do
  use EctoEnum.Postgres,
    type: :worker_type,
    enums: [:owner_company, :owner_organization, :admin_company, :admin_organization, :operator_digital, :operator_service, :collector, :accountant, :super_admin, :admin_system]

  @type type :: :owner_company | :owner_organization | :admin_company | :admin_organization | :operator_digital | :operator_service | :collector | :accountant | :super_admin | :admin_system
end

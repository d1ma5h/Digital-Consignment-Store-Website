defmodule DS.Repository.Rela do
  alias DS.Repository, as: R

  use Rela,
    repo: DS.Repo,
    relations: [
      #%{actor: R.Organization, contractor: R.Vendor, arity: :one_to_one},
      #%{actor: R.Organization, contractor: R.User, arity: :one_to_one},
      #%{actor: R.Organization, contractor: R.Client, arity: :one_to_one},
      #%{actor: R.Organization, contractor: R.Partner, arity: :one_to_one},
      #%{actor: R.Organization, contractor: R.Provider, arity: :one_to_one},
      #%{actor: R.Organization, contractor: R.Personnel, arity: :one_to_many},
      #%{actor: R.Organization, contractor: R.SimCard, arity: :one_to_many},
      #%{actor: R.Organization, contractor: R.EmailBox, arity: :one_to_many},
      #%{actor: R.Organization, contractor: R.Location, arity: :one_to_many},
      #%{actor: R.Organization, contractor: R.Store, arity: :one_to_many},
      #%{actor: R.Person, contractor: R.User, arity: :one_to_one},
      #%{actor: R.Person, contractor: R.Personnel, arity: :one_to_many},
      #%{actor: R.Person, contractor: R.SimCard, arity: :one_to_many},
      #%{actor: R.Person, contractor: R.EmailBox, arity: :one_to_many},
      #%{actor: R.Personnel, contractor: R.Location, arity: :one_to_one},
      #%{actor: R.Vendor, contractor: R.Cashbox, arity: :one_to_many},
      #%{actor: R.Vendor, contractor: R.Client, arity: :one_to_many},
      #%{actor: R.Cashbox, contractor: R.User, arity: :one_to_one},
      #%{actor: R.Client, contractor: R.Cashbox, arity: :one_to_many},
      #%{actor: R.Client, contractor: R.Partner, arity: :one_to_many},
      #%{actor: R.Partner, contractor: R.Cashbox, arity: :one_to_many},
      #%{actor: R.Provider, contractor: R.Vendor, arity: :one_to_many},
      #%{actor: R.Provider, contractor: R.Client, arity: :one_to_many},
      #%{actor: R.Store, contractor: R.Cashbox, arity: :one_to_many}
    ]
end

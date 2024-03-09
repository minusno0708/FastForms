defmodule FastForms.Repo do
  use Ecto.Repo,
    otp_app: :fast_forms,
    adapter: Ecto.Adapters.Postgres
end

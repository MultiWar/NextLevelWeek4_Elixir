defmodule RocketpayElixir.Repo do
  use Ecto.Repo,
    otp_app: :rocketpay_elixir,
    adapter: Ecto.Adapters.Postgres
end

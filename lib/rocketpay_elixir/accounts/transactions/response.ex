defmodule RocketpayElixir.Accounts.Transactions.Response do
  defstruct [:from_account, :to_account]

  alias RocketpayElixir.Account

  def build(%Account{} = from_account, %Account{} = to_account) do
    %__MODULE__{
      from_account: from_account,
      to_account: to_account
    }
  end
end

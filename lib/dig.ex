defmodule Dig do
  defdelegate ns(domain), to: Dig.NS, as: :get
  defdelegate ns!(domain), to: Dig.NS, as: :get!
  defdelegate a(domain), to: Dig.A, as: :get
  defdelegate a!(domain), to: Dig.A, as: :get!
end

defmodule Dig do
  defdelegate ns(domain), to: Dig.NS, as: :get
  defdelegate ns!(domain), to: Dig.NS, as: :get!
end

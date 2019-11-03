defmodule NS do
  @moduledoc """
  Wrapper around dig to get nameservers of a passed in domain
  """

  def get!(domain) do
    case get(domain) do
      {:ok, ns} ->
        ns

      {:error, msg, number} ->
        raise """
        Unable to get nameservers for domain: #{domain}
        Error message: #{msg}
        Error number: #{number}
        """
    end
  end

  @doc """
  Get nameservers

  ## Examples

      iex> {:ok, nameservers} = NS.get("google.com")
      iex> sorted = Enum.sort(nameservers)
      ["ns1.google.com", "ns2.google.com", "ns3.google.com", "ns4.google.com"]

  """
  def get(domain) do
    args = [
      "@1.1.1.1",
      "+noall",
      "+answer",
      "+short",
      "ns",
      domain
    ]

    case System.cmd("dig", args) do
      {output, 0} -> {:ok, format_output(output)}
      {msg, error_num} -> {:error, msg, error_num}
    end
  end

  defp format_output(output) do
    output
    |> String.split("\n")
    |> Enum.reject(&(&1 == ""))
    |> Enum.map(&String.trim_trailing(&1, "."))
  end
end

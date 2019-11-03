defmodule Dig.A do
  @moduledoc """
  Wrapper around dig to get a records of a passed in domain
  """

  def get!(domain) do
    case get(domain) do
      {:ok, ns} ->
        ns

      {:error, msg, number} ->
        raise """
        Unable to get a records for domain: #{domain}
        Error message: #{msg}
        Error number: #{number}
        """
    end
  end

  @doc """
  Get nameservers

  ## Examples

      iex> {:ok, a_records} = A.get("avencera.com")
      iex> Enum.sort(a_records)
      ["104.18.36.55", "104.18.37.55"]

  """
  def get(domain) do
    args = [
      "@1.1.1.1",
      "+noall",
      "+answer",
      "+short",
      "a",
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
  end
end

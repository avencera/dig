defmodule Dig.NSTest do
  use ExUnit.Case
  alias Dig.NS
  doctest Dig.NS

  test "gets nameservers for google.com" do
    {:ok, nameservers} = NS.get("google.com")

    assert Enum.sort(nameservers) ==
             ["ns1.google.com", "ns2.google.com", "ns3.google.com", "ns4.google.com"]
  end
end

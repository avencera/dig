defmodule NSTest do
  use ExUnit.Case
  doctest NS

  test "gets nameservers for google.com" do
    assert NS.get("google.com") ==
             {:ok, ["ns2.google.com", "ns4.google.com", "ns1.google.com", "ns3.google.com"]}
  end
end

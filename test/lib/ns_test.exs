defmodule Dig.ATest do
  use ExUnit.Case
  alias Dig.A
  doctest Dig.A

  test "gets a recordsfor avencera.com" do
    {:ok, a_records} = A.get("avencera.com")

    assert Enum.sort(a_records) == ["104.18.36.55", "104.18.37.55"]
  end
end

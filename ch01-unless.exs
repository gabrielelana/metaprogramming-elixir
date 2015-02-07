defmodule Metaprogramming.Elixir do
  defmodule ControlFlow do
    defmacro unless(expression, do: block) do
      quote do
        if !unquote(expression), do: unquote(block)
      end
    end
  end

  ExUnit.start

  defmodule ControlFlow.Test do
    use ExUnit.Case
    require ControlFlow

    test "unless" do
      unless 1 + 1 == 2 do
        flunk "1 + 1 must be equal to 2"
      end
    end
  end

end

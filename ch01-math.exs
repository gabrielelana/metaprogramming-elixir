defmodule Metaprogramming.Elixir do
  defmodule Math do
    # {:+, [context: Elixir, import: Kernel], [5, 2]}
    defmacro say({:+, _, [lhs, rhs]}) do
      quote do
        lhs = unquote(lhs)
        rhs = unquote(rhs)
        result = lhs + rhs
        "#{lhs} plus #{rhs} is #{result}"
      end
    end

    # {:*, [context: Elixir, import: Kernel], [8, 3]}
    defmacro say({:*, _, [lhs, rhs]}) do
      quote do
        lhs = unquote(lhs)
        rhs = unquote(rhs)
        result = lhs * rhs
        "#{lhs} times #{rhs} is #{result}"
      end
    end
  end

  ExUnit.start

  defmodule Math.Test do
    use ExUnit.Case
    require Math

    test "say a simple addition" do
      assert "5 plus 2 is 7" == Math.say 5 + 2
      assert "2 plus 40 is 42" == Math.say 2 + (20 + 20)
    end

    test "say a simple multiplication" do
      assert "5 times 2 is 10" == Math.say 5 * 2
      assert "2 times 10 is 20" == Math.say 2 * (5 + 5)
    end
  end
end

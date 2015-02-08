defmodule Metaprogramming.Elixir do
  defmodule Setter do
    defmacro useless_bind(value) do
      quote do
        name = unquote(value)
      end
    end

    defmacro working_bind(value) do
      quote do
        var!(name) = unquote(value)
      end
    end
  end

  ExUnit.start

  defmodule Setter.Test do
    use ExUnit.Case
    require Setter

    test "useless_bind" do
      name = "Gabriele"
      Setter.useless_bind("Chiara")
      assert "Gabriele" == name
    end

    test "working_bind" do
      name = "Gabriele"
      Setter.working_bind("Chiara")
      assert "Chiara" == name
    end
  end
end

defmodule FunctionCalculator do
@moduledoc """
A demonstration of the failings of HOF typespecs in elixir
"""
  @doc """
  At least you can *see* the HOF's types in the preview, right?
  """
  @spec calculate_2(operation :: (number(), number() -> number()), number(), number) :: number()
  def calculate_2(operation, op1, op2) do
    _math = op1 + op2
    operation.(op1, op2)
  end

  @spec encourage(x :: number(), y :: number()) :: String.t()
  defp encourage(x, y) do
    _math = x + y
    "You can do it!"
  end

  @spec discourage(x :: String.t(), y :: String.t()) :: String.t()
  defp discourage(x, y) do
    "You can't do it!" <> x <> y
  end

  defp advise(x, y, z) do
    "I think you should do the following: " <> x <> y <> z
  end

  def example do
    calculate_2(fn x, y -> x * y end, 1, 2)
    # calculate_2(fn x -> x end, 1, 2)
    # calculate_2(fn x, y, _z -> x * y end, 1, 2)
    # calculate_2(nil, 1, 2)

    # Argument function's types ARE NOT CHECKED. Only check is done against arity. Why José???
    # calculate_2(fn _x, _y -> "You can do it!" end, 1, 2)
    # calculate_2(&encourage/2, 1, 2)
    # calculate_2(&discourage/2, 1, 2)
    # calculate_2(&advise/3, 1, 2)
  end
end

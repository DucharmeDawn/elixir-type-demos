defmodule SimpleCalculator do
  @moduledoc """
    Here is a list of all Elixir's basic types https://hexdocs.pm/elixir/typespecs.html#basic-types
  """
  @type simple_operation :: :add | :subtract
  @spec simple_calculate(operation :: simple_operation(), operands :: list(number())) :: number()
  @doc """
  Calculate using some pre-defined functions - only accepts 2 operands at a time
  """
  def simple_calculate(operation, [op1, op2] = _operands) do
    case operation do
      :add -> op1 + op2
      :subtract -> op1 - op2
    end
  end

  def examples do
    simple_calculate(:add, [1, 2])
    # simple_calculate(:multiply, [3, 4])
    # simple_calculate(:subtract, 1)
    # simple_calculate(:subtract, nil)
  end
end

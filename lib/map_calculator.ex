defmodule MapCalculator do
  @moduledoc """
  Much of this info sourced from here: http://crevalle.io/maps-in-typespecs.html
  """
  defmodule Result do
    @type t :: {:ok, number()} | {:error, String.t()}
  end

  defmodule Params do
    @moduledoc """
    A struct for the params.
    """
    @type supported_operations :: :add | :subtract | :multiply | :divide
    @typedoc """
    A type for the params struct.
    """
    @type t :: %{
            required(supported_operations()) => number(),
            required(:base) => number(),
            optional(:modulo) => number(),
            # optional(String.t()) => String.t() - This is supported
            # optional(any()) => any - This makes the map accept all non-specified keys
          }

    @enforce_keys [:base]
    defstruct [:add, :subtract, :multiply, :divide, :base, :modulo]
  end

  @spec map_calculate(Params.t(), number()) :: Result.t()
  @doc """
  Calculate using more complicated operations. Takes a map, returns a tuple
  """
  def map_calculate(_parameters, _operand) do
    # TODO
    {:ok, 0}
  end

  def examples do
    params = %{
      base: 10,
      add: 1,
      subtract: 2,
      multiply: 4,
      divide: 5,
      modulo: 3
    }

    # params = %Params{
    #   base: 10,
    #   add: 1,
    #   subtract: 2,
    #   multiply: 4,
    #   divide: 5,
    #   modulo: 3
    # }

    # params = %Params{
    #   base: 10,
    #   add: 1,
    #   log: 2
    # }

    # params = %{
    #   base: 10,
    #   add: 1,
    #   log: 2
    # }

    # Notice how Dialyzer likes this one. Requiring Union key types doesn't make them required. This seems like a bug.
    # params = %{
    #   base: 10,
    #   modulo: 2
    # }

    # params = %Params{
    #   base: 10,
    #   modulo: 2
    # }

    # params = %Params{
    #   add: 1
    # }

    # params = %{
    #   add: 1
    # }

    map_calculate(params, 1)
  end
end

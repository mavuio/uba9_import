defmodule MwHelpers do
  @moduledoc """
    generic helpers by Manfred Wuits
  """

  @doc """
  array_get helper taken from laravel
  """
  def array_get(data, keys, default \\ nil) do
    keys2 =
      case keys do
        key when is_binary(key) or is_atom(key) -> [key]
        keys when is_list(keys) -> keys
      end

    case get_in(data, keys2) do
      nil -> default
      result -> result
    end
  end

  defmacro pipe_when(left, condition, fun) do
    quote do
      left = unquote(left)

      if unquote(condition),
        do: left |> unquote(fun),
        else: left
    end
  end

  def struct_from_map(a_map, as: a_struct) do
    # Find the keys within the map
    keys =
      Map.keys(a_struct)
      |> Enum.filter(fn x -> x != :__struct__ end)

    # Process map, checking for both string / atom keys
    processed_map =
      for key <- keys, into: %{} do
        value = Map.get(a_map, key) || Map.get(a_map, to_string(key))
        {key, value}
      end

    processed_map |> IO.inspect(label: "mwuits-debug 2018-08-14_11:07 ")

    # a_struct = Map.merge(a_struct, processed_map)
    a_struct
  end

  def dec_to_str(nil) do
    dec_to_str("0")
  end

  def dec_to_str(string) when is_binary(string) do
    dec_to_str(Decimal.new(string))
  end

  def dec_to_str(int) when is_integer(int) do
    "#{int}"
  end

  def dec_to_str(float) when is_float(float) do
    "#{float}"
  end

  def dec_to_str(decimal) do
    # fix_suffix = fn suf -> suf |> String.trim_trailing("0") end

    Decimal.set_context(%Decimal.Context{Decimal.get_context() | precision: 5})

    num =
      decimal
      |> Decimal.to_string(:normal)

    if(String.contains?(num, ".")) do
      num
      |> String.trim_trailing("0")
      |> (&(&1 <> "0")).()
    else
      num
    end
  end

  def to_int(val) do
    case val do
      val when is_integer(val) -> val
      val when is_binary(val) -> String.to_integer(val)
      %Decimal{} = val -> Decimal.to_integer(val)
      nil -> nil
    end
  end

  def zip_merge(list1, list2, list \\ [])

  def zip_merge([], [], list) do
    list
  end

  def zip_merge([_ | _] = list1, [], list) do
    list ++ list1
  end

  def zip_merge([], [_ | _] = list2, list) do
    list ++ list2
  end

  def zip_merge([item1 | list1], [item2 | list2], list) do
    {list1, list2, list} |> MwError.log(label: "mwuits-debug 2018-10-18_18:07 ")
    zip_merge(list1, list2, list ++ [item1, item2])
  end

  # def present?(term) do
  #   !Blankable.blank?(term)
  # end

  # def empty?(term) do
  #   Blankable.blank?(term)
  # end
end

defmodule MwError do
  defexception message: "error", short_message: "", plug_status: 503, data: :no_extra_info

  def full_message(%MwError{} = error) do
    res = "MwError: #{error.message}"

    case error.data do
      :no_extra_info -> res
      data -> res <> " ⇢ " <> inspect(data, limit: 3, pretty: true)
    end
  end

  def full_message(error) do
    "Error: " <> inspect(error, limit: 10)
  end

  def exception({msg}) do
    %__MODULE__{message: msg, data: nil, short_message: msg}
  end

  def exception({msg, nil}) do
    %__MODULE__{message: msg, data: nil, short_message: msg}
  end

  def exception({msg, extra_data}) do
    long_msg = msg <> " ➜ " <> inspect(extra_data, limit: 3000, pretty: true)

    %__MODULE__{message: long_msg, data: :no_extra_info, short_message: msg}
  end

  def exception(msg) do
    %__MODULE__{message: msg, data: nil, short_message: msg}
  end

  def die(data, options) do
    raise __MODULE__, {options[:label], data}
  end

  def log(data, options) do
    data |> IO.inspect(label: options[:label])
  end
end

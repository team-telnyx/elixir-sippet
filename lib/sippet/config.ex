defmodule Sippet.Config do
  @moduledoc """
  This module is used for configuration, to retrieve environment variable
  """

  # def get_env(key) do
  #   value = :watchdog
  #   |> Application.get_env(key, [])
  #   |> Configurative.fetch_value!
  #   case Atom.to_string(key) =~ ~r/delay/ do
  #     true -> String.to_integer(value) * 1000
  #     _ -> value
  #   end
  # end

  def get_env_int(key) do

    :sippet
    |> Application.get_env(key, [])
    |> Configurative.fetch_value!
    |> String.to_integer
  end

  def get_env(key) do
    value = :sippet
    |> Application.get_env(key, [])
    |> Configurative.fetch_value!
  end

end

defmodule Plug.Statsd.NullStatsdBackend do
  def increment(_name, _rate, _tags) do
    nil
  end

  def timing(_name, elapsed, _rate, _tags) do
    elapsed
  end

  def histogram(_name, elapsed, _rate, _tags) do
    elapsed
  end
end

if Code.ensure_loaded?(:statsderl) do
  defmodule Plug.Statsd.StatsderlBackend do
    def increment(name, rate, _tags) do
      :statsderl.increment(name, 1, rate)
    end

    def timing(name, elapsed, rate, _tags) do
      :statsderl.timing(name, elapsed, rate)
    end
  end
end

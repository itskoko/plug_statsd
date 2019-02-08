if Code.ensure_loaded?(ExStatsD) do
  defmodule Plug.Statsd.ExStatsdBackend do
    def increment(name, rate, _tags) do
      ExStatsD.increment(name, sample_rate: rate)
    end

    def timing(name, elapsed, rate, _tags) do
      ExStatsD.timer(elapsed, name, sample_rate: rate)
    end

    def histogram(name, elapsed, rate, _tags) do
      ExStatsD.histogram(elapsed, name, sample_rate: rate)
    end
  end
end

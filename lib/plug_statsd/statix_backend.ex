if Code.ensure_loaded?(Statix) do
  defmodule Plug.Statsd.StatixBackend do
    def increment(name, 1, tags) do
      increment(name, 1.0, tags)
    end

    def increment(name, rate, tags) when is_float(rate) do
      get_conn().increment(name, 1, sample_rate: rate, tags: tags)
    end

    def timing(name, elapsed, 1, tags) do
      timing(name, elapsed, 1.0, tags)
    end

    def timing(name, elapsed, rate, tags) when is_float(rate) do
      get_conn().timing(name, elapsed, sample_rate: rate, tags: tags)
    end

    def histogram(name, elapsed, 1, tags), do: histogram(name, elapsed, 1.0, tags)

    def histogram(name, elapsed, rate, tags) when is_float(rate) do
      get_conn().histogram(name, elapsed, sample_rate: rate, tags: tags)
    end

    defp get_conn do
      Application.get_env(:plug_statsd, :statix_backend_conn)
    end
  end
end

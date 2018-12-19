use Mix.Config

config :k8s_conf, providers: []

if Mix.env() == :dev do
  config :mix_test_watch,
    tasks: [
      "test",
      "format",
      "credo"
    ]
end

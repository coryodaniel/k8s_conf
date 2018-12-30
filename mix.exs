defmodule K8sConf.MixProject do
  use Mix.Project

  def project do
    [
      app: :k8s_conf,
      description: "k8s_conf parses Kubernetes config files and generates HTTP headers and options for authenticating to the Kubernetes API.",
      version: "0.1.1",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        "coveralls.travis": :test
      ],
      docs: [
        extras: ["README.md"],
        main: "readme"
      ],
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:yaml_elixir, "~> 2.1"},

      # Dev dependencies
      {:mix_test_watch, "~> 0.8", only: :dev, runtime: false},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0.0-rc.4", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.19", only: :dev},
      {:excoveralls, "~> 0.10", only: :test}
    ]
  end

  defp package do
    [
      name: :k8s_conf,
      maintainers: ["Cory O'Daniel"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/coryodaniel/k8s_conf"
      }
    ]
  end
end

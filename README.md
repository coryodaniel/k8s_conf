# K8s.Conf

[K8s.Conf](https://hexdocs.pm/k8s_conf/readme.html) parses Kubernetes config files and generates HTTP headers and options for authenticating to the Kubernetes API.

[![Build Status](https://travis-ci.org/coryodaniel/k8s_conf.svg?branch=master)](https://travis-ci.org/coryodaniel/k8s_conf)
[![Coverage Status](https://coveralls.io/repos/github/coryodaniel/k8s_conf/badge.svg?branch=master)](https://coveralls.io/github/coryodaniel/k8s_conf?branch=master)
[![Hex.pm](http://img.shields.io/hexpm/v/k8s_conf.svg?style=flat)](https://hex.pm/packages/k8s_conf) 
[![Documentation](https://img.shields.io/badge/documentation-on%20hexdocs-green.svg)](https://hexdocs.pm/k8s_conf/)
![Hex.pm](https://img.shields.io/hexpm/l/k8s_conf.svg?style=flat)


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `k8s_conf` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:k8s_conf, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/k8s_conf](https://hexdocs.pm/k8s_conf).

## Usage

```elixir
# Defaults to 'current-context', optionally set cluster, context, or user
# opts = [
#   user: "alt-user",
#   cluster: "alt-cluster",
#   context: "alt-context"
# ]

opts = []
config = K8s.Conf.from_file("~/.kube/config", opts)

# Optionally load from a service account
# config = K8s.Conf.from_service_account()

http_request_options = K8s.Conf.RequestOptions.generate(config)
[header: headers, ssl_options: ssl_options] = http_request_options

# Add headers and SSL options to HTTP library of choice
```

### Adding authorization providers

```elixir
config :k8s_conf, providers: [My.Custom.Provider]
```

Providers are checked in order, the first to return an authorization struct wins.

Custom providers are processed before default providers.

See [Certicate](lib/k8s/conf/auth/certificate.ex) and [Token](lib/k8s/conf/auth/token.ex) for protocol and behavior implementations.

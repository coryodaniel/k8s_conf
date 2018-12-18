# K8s.Conf

Handles kubernetes config file parsing and HTTP request signing.

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
ops = []

# Defaults to 'current-context', optionally set cluster, context, or user
# opts = [
#   user: "alt-user",
#   cluster: "alt-cluster",
#   context: "alt-context"
# ]

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

## Testing

```shell
mix test --cover
mix credo
mix dialyzer
```

## TODO

* [ ] [`exec` provider](https://kubernetes.io/docs/reference/access-authn-authz/authentication/#configuration)
* [ ] [`auth-provider` provider](https://kubernetes.io/docs/reference/access-authn-authz/authentication/#option-1-oidc-authenticator)

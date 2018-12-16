defprotocol K8s.Conf.RequestOptions do
  @moduledoc """
  Encapsulates HTTP request options for an authentication provider.
  """

  @typedoc """
  HTTP Request options
  """
  @type t :: %{headers: list, ssl_options: list}
  defstruct [:headers, :ssl_options]

  @spec generate(struct) :: K8s.Conf.RequestOptions.t()
  def generate(auth)
end

defimpl K8s.Conf.RequestOptions, for: Any do
  def generate(_), do: nil
end

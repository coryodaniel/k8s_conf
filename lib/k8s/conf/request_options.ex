defprotocol K8s.Conf.RequestOptions do
  @moduledoc """
  Encapsulates HTTP request options for an authentication provider.
  """

  @typedoc """
  HTTP Request options
  """
  @type t :: %__MODULE__{headers: list(), ssl_options: keyword()}
  defstruct [:headers, :ssl_options]

  @spec generate(struct) :: K8s.Conf.RequestOptions.t() | nil
  def generate(auth)
end

defimpl K8s.Conf.RequestOptions, for: Any do
  @spec generate(any()) :: nil
  def generate(_), do: nil
end

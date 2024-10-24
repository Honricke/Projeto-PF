defmodule App2Web.SenhaHTML do
  use App2Web, :html

  embed_templates "senha_html/*"

  @doc """
  Renders a senha form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def senha_form(assigns)
end

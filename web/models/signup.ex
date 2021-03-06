defmodule LightningTalks.Signup do
  use LightningTalks.Web, :model

  schema "signup" do
    field :name, :string
    field :topic, :string
    field :description, :string

    timestamps
  end

  @required_fields ~w(name topic)
  @optional_fields ~w(description)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end

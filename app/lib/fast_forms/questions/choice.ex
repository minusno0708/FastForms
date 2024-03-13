defmodule FastForms.Questions.Choice do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "choices" do
    field :count, :integer
    field :content, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(choice, attrs) do
    choice
    |> cast(attrs, [:content, :count])
    |> validate_required([:content, :count])
  end
end

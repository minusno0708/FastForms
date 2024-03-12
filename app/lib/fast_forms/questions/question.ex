defmodule FastForms.Questions.Question do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "questions" do
    field :type, :integer
    field :title, :string
    field :deadline, :date

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:title, :type, :deadline])
    |> validate_required([:title, :type])
  end

  def type_label(type) do
    case type do
      1 -> "Radio"
      2 -> "Select"
      _ -> "Unknown"
    end
  end
end

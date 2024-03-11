defmodule FastForms.Questions.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :type, :integer
    field :title, :string
    field :deadline, :naive_datetime
    field :uuid, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:uuid, :title, :type, :deadline])
    |> validate_required([:title, :type])
  end
end

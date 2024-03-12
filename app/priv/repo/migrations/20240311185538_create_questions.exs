defmodule FastForms.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :type, :integer
      add :deadline, :date

      timestamps(type: :utc_datetime)
    end
  end
end

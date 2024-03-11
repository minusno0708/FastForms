defmodule FastForms.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :uuid, :string
      add :title, :string
      add :type, :integer
      add :deadline, :date

      timestamps(type: :utc_datetime)
    end
  end
end

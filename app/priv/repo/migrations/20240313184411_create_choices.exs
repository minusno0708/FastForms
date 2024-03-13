defmodule FastForms.Repo.Migrations.CreateChoices do
  use Ecto.Migration

  def change do
    create table(:choices, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :content, :string
      add :count, :integer

      timestamps(type: :utc_datetime)
    end
  end
end

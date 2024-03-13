defmodule FastForms.Questions do
  @moduledoc """
  The Questions context.
  """

  import Ecto.Query, warn: false
  alias FastForms.Repo

  alias FastForms.Questions.Question

  @doc """
  Returns the list of questions.

  ## Examples

      iex> list_questions()
      [%Question{}, ...]

  """
  def list_questions do
    Repo.all(Question)
  end

  @doc """
  Gets a single question.

  Raises `Ecto.NoResultsError` if the Question does not exist.

  ## Examples

      iex> get_question!(123)
      %Question{}

      iex> get_question!(456)
      ** (Ecto.NoResultsError)

  """
  def get_question!(id), do: Repo.get!(Question, id)

  @doc """
  Creates a question.

  ## Examples

      iex> create_question(%{field: value})
      {:ok, %Question{}}

      iex> create_question(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_question(attrs \\ %{}) do
    %Question{}
    |> Question.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a question.

  ## Examples

      iex> update_question(question, %{field: new_value})
      {:ok, %Question{}}

      iex> update_question(question, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_question(%Question{} = question, attrs) do
    question
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a question.

  ## Examples

      iex> delete_question(question)
      {:ok, %Question{}}

      iex> delete_question(question)
      {:error, %Ecto.Changeset{}}

  """
  def delete_question(%Question{} = question) do
    Repo.delete(question)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking question changes.

  ## Examples

      iex> change_question(question)
      %Ecto.Changeset{data: %Question{}}

  """
  def change_question(%Question{} = question, attrs \\ %{}) do
    Question.changeset(question, attrs)
  end

  alias FastForms.Questions.Choice

  @doc """
  Returns the list of choices.

  ## Examples

      iex> list_choices()
      [%Choice{}, ...]

  """
  def list_choices do
    Repo.all(Choice)
  end

  @doc """
  Gets a single choice.

  Raises `Ecto.NoResultsError` if the Choice does not exist.

  ## Examples

      iex> get_choice!(123)
      %Choice{}

      iex> get_choice!(456)
      ** (Ecto.NoResultsError)

  """
  def get_choice!(id), do: Repo.get!(Choice, id)

  @doc """
  Creates a choice.

  ## Examples

      iex> create_choice(%{field: value})
      {:ok, %Choice{}}

      iex> create_choice(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_choice(attrs \\ %{}) do
    %Choice{}
    |> Choice.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a choice.

  ## Examples

      iex> update_choice(choice, %{field: new_value})
      {:ok, %Choice{}}

      iex> update_choice(choice, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_choice(%Choice{} = choice, attrs) do
    choice
    |> Choice.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a choice.

  ## Examples

      iex> delete_choice(choice)
      {:ok, %Choice{}}

      iex> delete_choice(choice)
      {:error, %Ecto.Changeset{}}

  """
  def delete_choice(%Choice{} = choice) do
    Repo.delete(choice)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking choice changes.

  ## Examples

      iex> change_choice(choice)
      %Ecto.Changeset{data: %Choice{}}

  """
  def change_choice(%Choice{} = choice, attrs \\ %{}) do
    Choice.changeset(choice, attrs)
  end
end

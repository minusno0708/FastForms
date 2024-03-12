defmodule FastForms.QuestionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FastForms.Questions` context.
  """

  @doc """
  Generate a question.
  """
  def question_fixture(attrs \\ %{}) do
    {:ok, question} =
      attrs
      |> Enum.into(%{
        deadline: ~D[2024-03-10],
        title: "some title",
        type: 42
      })
      |> FastForms.Questions.create_question()

    question
  end
end

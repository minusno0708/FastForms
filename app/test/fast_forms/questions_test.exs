defmodule FastForms.QuestionsTest do
  use FastForms.DataCase

  alias FastForms.Questions

  describe "questions" do
    alias FastForms.Questions.Question

    import FastForms.QuestionsFixtures

    @invalid_attrs %{type: nil, title: nil, deadline: nil, uuid: nil}

    test "list_questions/0 returns all questions" do
      question = question_fixture()
      assert Questions.list_questions() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert Questions.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      valid_attrs = %{type: 42, title: "some title", deadline: ~D[2024-03-10], uuid: "b50d565a-191d-4dc1-9c63-d0257f5984c2"}

      assert {:ok, %Question{} = question} = Questions.create_question(valid_attrs)
      assert question.type == 42
      assert question.title == "some title"
      assert question.deadline == ~D[2024-03-10]
      assert question.uuid == "b50d565a-191d-4dc1-9c63-d0257f5984c2"
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Questions.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()
      update_attrs = %{type: 43, title: "some updated title", deadline: ~D[2024-03-11], uuid: "6092fa93-e575-42d7-978a-f82d2b9a7569"}

      assert {:ok, %Question{} = question} = Questions.update_question(question, update_attrs)
      assert question.type == 43
      assert question.title == "some updated title"
      assert question.deadline == ~D[2024-03-11]
      assert question.uuid == "6092fa93-e575-42d7-978a-f82d2b9a7569"
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = Questions.update_question(question, @invalid_attrs)
      assert question == Questions.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = Questions.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> Questions.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = Questions.change_question(question)
    end
  end
end

defmodule FastForms.QuestionsTest do
  use FastForms.DataCase

  alias FastForms.Questions

  describe "questions" do
    alias FastForms.Questions.Question

    import FastForms.QuestionsFixtures

    @invalid_attrs %{type: nil, title: nil, deadline: nil}

    test "list_questions/0 returns all questions" do
      question = question_fixture()
      assert Questions.list_questions() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert Questions.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      valid_attrs = %{type: 1, title: "some title", deadline: ~D[2024-03-10]}

      assert {:ok, %Question{} = question} = Questions.create_question(valid_attrs)
      assert question.type == 1
      assert question.title == "some title"
      assert question.deadline == ~D[2024-03-10]
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Questions.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()
      update_attrs = %{type: 2, title: "some updated title", deadline: ~D[2024-03-11]}

      assert {:ok, %Question{} = question} = Questions.update_question(question, update_attrs)
      assert question.type == 2
      assert question.title == "some updated title"
      assert question.deadline == ~D[2024-03-11]
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

  describe "choices" do
    alias FastForms.Questions.Choice

    import FastForms.QuestionsFixtures

    @invalid_attrs %{count: nil, content: nil}

    test "list_choices/0 returns all choices" do
      choice = choice_fixture()
      assert Questions.list_choices() == [choice]
    end

    test "get_choice!/1 returns the choice with given id" do
      choice = choice_fixture()
      assert Questions.get_choice!(choice.id) == choice
    end

    test "create_choice/1 with valid data creates a choice" do
      valid_attrs = %{count: 42, content: "some content"}

      assert {:ok, %Choice{} = choice} = Questions.create_choice(valid_attrs)
      assert choice.count == 42
      assert choice.content == "some content"
    end

    test "create_choice/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Questions.create_choice(@invalid_attrs)
    end

    test "update_choice/2 with valid data updates the choice" do
      choice = choice_fixture()
      update_attrs = %{count: 43, content: "some updated content"}

      assert {:ok, %Choice{} = choice} = Questions.update_choice(choice, update_attrs)
      assert choice.count == 43
      assert choice.content == "some updated content"
    end

    test "update_choice/2 with invalid data returns error changeset" do
      choice = choice_fixture()
      assert {:error, %Ecto.Changeset{}} = Questions.update_choice(choice, @invalid_attrs)
      assert choice == Questions.get_choice!(choice.id)
    end

    test "delete_choice/1 deletes the choice" do
      choice = choice_fixture()
      assert {:ok, %Choice{}} = Questions.delete_choice(choice)
      assert_raise Ecto.NoResultsError, fn -> Questions.get_choice!(choice.id) end
    end

    test "change_choice/1 returns a choice changeset" do
      choice = choice_fixture()
      assert %Ecto.Changeset{} = Questions.change_choice(choice)
    end
  end
end

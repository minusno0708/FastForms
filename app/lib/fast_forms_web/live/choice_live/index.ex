defmodule FastFormsWeb.ChoiceLive.Index do
  use FastFormsWeb, :live_view

  alias FastForms.Questions
  alias FastForms.Questions.Choice

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :choices, Questions.list_choices())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Choice")
    |> assign(:choice, Questions.get_choice!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Choice")
    |> assign(:choice, %Choice{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Choices")
    |> assign(:choice, nil)
  end

  @impl true
  def handle_info({FastFormsWeb.ChoiceLive.FormComponent, {:saved, choice}}, socket) do
    {:noreply, stream_insert(socket, :choices, choice)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    choice = Questions.get_choice!(id)
    {:ok, _} = Questions.delete_choice(choice)

    {:noreply, stream_delete(socket, :choices, choice)}
  end
end

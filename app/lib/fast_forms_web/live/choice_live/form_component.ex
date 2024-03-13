defmodule FastFormsWeb.ChoiceLive.FormComponent do
  use FastFormsWeb, :live_component

  alias FastForms.Questions

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage choice records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="choice-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:content]} type="text" label="Content" />
        <.input field={@form[:count]} type="number" label="Count" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Choice</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{choice: choice} = assigns, socket) do
    changeset = Questions.change_choice(choice)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"choice" => choice_params}, socket) do
    changeset =
      socket.assigns.choice
      |> Questions.change_choice(choice_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"choice" => choice_params}, socket) do
    save_choice(socket, socket.assigns.action, choice_params)
  end

  defp save_choice(socket, :edit, choice_params) do
    case Questions.update_choice(socket.assigns.choice, choice_params) do
      {:ok, choice} ->
        notify_parent({:saved, choice})

        {:noreply,
         socket
         |> put_flash(:info, "Choice updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_choice(socket, :new, choice_params) do
    case Questions.create_choice(choice_params) do
      {:ok, choice} ->
        notify_parent({:saved, choice})

        {:noreply,
         socket
         |> put_flash(:info, "Choice created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end

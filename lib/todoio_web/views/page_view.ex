defmodule TodoioWeb.PageView do
  use TodoioWeb, :view

  def render("list.json", %{todos: todos}) do
    todos
    |> Enum.map(&todo_to_json/1)
  end

  def todo_to_json(todo) do
    %{
      text: todo.text,
      complete: todo.complete
    }
  end
end

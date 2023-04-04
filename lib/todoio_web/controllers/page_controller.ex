defmodule TodoioWeb.PageController do
  use TodoioWeb, :controller

  alias Todoio.TodoListAgent

  def index(conn, _params) do
    todos = TodoListAgent.get_list(:todo_list)
    render(conn, "index.html", todos: todos)
  end

  ## API

  def list(conn, _params) do
    todos = TodoListAgent.get_list(:todo_list)
    render(conn, "list.json", todos: todos)
  end

  def add(conn, %{"item" => text}) do
    IO.puts("Got text #{text}")
    todos = TodoListAgent.get_list(:todo_list)
    render(conn, "list.json", todos: todos)
  end

  def delete(conn, %{"text" => text}) do
    TodoListAgent.remove_item(:todo_list, text)
    render(conn, "list.json", todos: TodoListAgent.get_list(:todo_list))
  end

end

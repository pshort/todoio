defmodule Todoio.TodoListAgent do
  use Agent

  # Agent.get(pid, ?)
  # Agent.update(pid, ?)

  # fn arg -> ... end

  def start_link(starting_list) do
    Agent.start_link(fn -> starting_list end)
  end

  def start_link_named(starting_list, name) do
    Agent.start_link(fn -> starting_list end, name: name)
  end

  def get_list(list_pid) do
  end

  def add_item(list_pid, description) do
  end

  def complete_item(list_pid, text) do
  end

  def remove_item(list_pid, text) do
  end

end

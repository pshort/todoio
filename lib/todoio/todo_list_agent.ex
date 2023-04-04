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
    Agent.get(list_pid, &(&1))
  end

  def add_item(list_pid, description) do
    new_item = [%{text: description, complete: false}]
    Agent.update(list_pid, &Enum.concat(&1, new_item))
  end

  def complete_item(list_pid, text) do
    Agent.update(list_pid, &Enum.map(&1, fn item ->
      case item.text == text do
        true -> Map.put(item, :complete, true)
        false -> item
      end
    end))
  end

  def remove_item(list_pid, text) do
    Agent.update(list_pid, &Enum.filter(&1, fn item ->
      item.text != text
    end))
  end

end

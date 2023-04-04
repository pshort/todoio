defmodule Todoio.TodoListAgentTest do
  use ExUnit.Case, async: true

  test "creates a new list" do
    {:ok, list} = Todoio.TodoListAgent.start_link([])

    assert Todoio.TodoListAgent.get_list(list) == []
  end

  test "creates a named list" do
    Todoio.TodoListAgent.start_link_named([1,2,3], :test)
    assert Todoio.TodoListAgent.get_list(:test) == [1,2,3]
  end

  test "adds items to the list" do
    {:ok, list} = Todoio.TodoListAgent.start_link([])

    Todoio.TodoListAgent.add_item(list, "Eat lunch!")
    Todoio.TodoListAgent.add_item(list, "Finish the big project!")

    assert Todoio.TodoListAgent.get_list(list) == [
      %{text: "Eat lunch!", complete: false},
      %{text: "Finish the big project!", complete: false}
    ]
  end

  test "completes an item" do
    {:ok, list} = Todoio.TodoListAgent.start_link([])

    Todoio.TodoListAgent.add_item(list, "Eat lunch!")
    Todoio.TodoListAgent.add_item(list, "Finish the big project!")
    Todoio.TodoListAgent.complete_item(list, "Eat lunch!")

    assert Todoio.TodoListAgent.get_list(list) == [
      %{text: "Eat lunch!", complete: true},
      %{text: "Finish the big project!", complete: false}
    ]
  end

  test "removes an item" do
    {:ok, list} = Todoio.TodoListAgent.start_link([])

    Todoio.TodoListAgent.add_item(list, "Eat lunch!")
    Todoio.TodoListAgent.add_item(list, "Finish the big project!")
    Todoio.TodoListAgent.remove_item(list, "Eat lunch!")

    assert Todoio.TodoListAgent.get_list(list) == [%{text: "Finish the big project!", complete: false}]
  end

end

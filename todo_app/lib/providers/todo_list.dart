// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoListState extends Equatable {
  final List<Todo> todo;

  TodoListState({required this.todo});

  factory TodoListState.initial() {
    return TodoListState(todo: [
      Todo(id: '1', desc: 'learn dart'),
      Todo(id: '2', desc: 'learn flutter'),
      Todo(id: '3', desc: 'learn package')
    ]);
  }

  @override
  List<Object> get props => [todo];

  @override
  bool get stringify => true;

  TodoListState copyWith({
    List<Todo>? todo,
  }) {
    return TodoListState(
      todo: todo ?? this.todo,
    );
  }
}

class TodoList with ChangeNotifier {
  TodoListState _state = TodoListState.initial();
  TodoListState get state => _state;

  void addTodo(String todoDesc) {
    final newTodo = Todo(desc: todoDesc);
    final newTodos = [..._state.todo, newTodo];

    _state = _state.copyWith(todo: newTodos);
    notifyListeners();
  }

  void editTodo(String id, String todoDesc) {
    final newTodos = _state.todo.map((Todo todo) {
      if (todo.id == id) {
        return Todo(
          id: id,
          desc: todoDesc,
          completed: todo.completed,
        );
      }
      return todo;
    }).toList();

    _state = _state.copyWith(todo: newTodos);
    notifyListeners();
  }

  void toggleTodo(String id) {
    final newTodos = _state.todo.map((Todo todo) {
      if (todo.id == id) {
        return Todo(
          id: id,
          desc: todo.desc,
          completed: !todo.completed,
        );
      }
      return todo;
    }).toList();

    _state = _state.copyWith(todo: newTodos);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    final newTodos = _state.todo.where((Todo t) => t.id != todo.id).toList();
    _state = state.copyWith(todo: newTodos);

    notifyListeners();
  }
}

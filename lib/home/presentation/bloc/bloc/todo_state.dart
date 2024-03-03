part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TasksLoadInProgress extends TodoState {}

class TasksLoadSuccess extends TodoState {
  final List<TasksModel> tasks;

  TasksLoadSuccess([this.tasks = const <TasksModel>[]]);

  @override
  List<Object> get props => [tasks];
}

part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class TaskAdded extends TodoEvent {
  final TasksModel task;

  const TaskAdded(this.task);

  @override
  List<Object> get props => [task];
}

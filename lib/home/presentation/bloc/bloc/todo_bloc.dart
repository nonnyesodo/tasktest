import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/todo_model.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<TaskAdded>((event, emit) {
      final state = this.state;
      log(state.toString());
      if (state is TodoInitial) {
        var newState = [event.task];
        emit(TasksLoadSuccess(newState));
      } else if (state is TasksLoadSuccess) {
        final currentState = state.tasks;
        currentState.add(event.task);
        emit(TasksLoadInProgress());
        emit(TasksLoadSuccess(currentState));
      }
    });
  }
}

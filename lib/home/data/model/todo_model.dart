import 'package:equatable/equatable.dart';

class TasksModel extends Equatable {
  final String title;

  const TasksModel(this.title);
  @override
  List<Object> get props => [title];
}

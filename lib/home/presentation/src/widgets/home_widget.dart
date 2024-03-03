import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/todo_model.dart';
import '../../bloc/bloc/todo_bloc.dart';

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    final taskcontroler = TextEditingController();
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Add task Here'),
          SizedBox(height: 15),
          TextField(controller: taskcontroler),
          SizedBox(height: 15),
          Button(
              size: size,
              title: 'Add Task',
              onTap: () {
                BlocProvider.of<TodoBloc>(context)
                    .add(TaskAdded(TasksModel(taskcontroler.text)));

                Navigator.pop(context);
                taskcontroler.clear();
              })
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({super.key, required this.size, this.onTap, this.title});

  final Size size;
  final Function()? onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          width: size.width,
          height: size.height * 0.055,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(size.width * 0.02)),
          child: Text(title ?? 'Add',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600))),
    );
  }
}

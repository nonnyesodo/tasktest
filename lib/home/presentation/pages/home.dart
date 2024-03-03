import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc/todo_bloc.dart';
import '../src/widgets/home_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.all(size.width * 0.03),
      child: Column(children: [
        const Text('todo list'),
        BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state is TasksLoadSuccess) {
              return Expanded(
                  child: ListView.builder(
                      itemCount: state.tasks.length,
                      itemBuilder: (context, index) =>
                          ListTile(title: Text(state.tasks[index].title))));
            } else {
              return const CircularProgressIndicator.adaptive();
            }
          },
        ),
        Button(
            onTap: () => showDialog(
                context: context,
                builder: (context) {
                  return AddTaskDialog(size: size);
                }),
            size: size),
      ]),
    )));
  }
}

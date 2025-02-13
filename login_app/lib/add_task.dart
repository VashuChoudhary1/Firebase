import 'package:flutter/material.dart';
import 'package:login_app/task.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text("Add New Task"),
      content: TextField(
        controller: taskController,
        decoration: InputDecoration(hintText: "Enter your task here"),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (taskController.text.isNotEmpty) {
              Navigator.of(context).pop(
                ListItem(title: taskController.text),
              );
            }
          },
          child: Text("Add"),
        )
      ],
    );
  }
}

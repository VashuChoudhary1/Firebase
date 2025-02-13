import 'package:flutter/material.dart';

class TaskBar extends StatefulWidget {
  final List<ListItem> tasks;
  const TaskBar({super.key, required this.tasks});

  @override
  State<TaskBar> createState() => _TaskBarState();
}

class _TaskBarState extends State<TaskBar> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.all(7),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10,
            child: ListTile(
              leading: Icon(
                Icons.task_alt_rounded,
                color: Colors.blue,
              ),
              title: Text(widget.tasks[index].title),
              trailing: Checkbox(
                value: widget.tasks[index].isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    widget.tasks[index].isChecked = value ?? false;
                  });
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class ListItem {
  final String title;
  bool isChecked;

  ListItem({required this.title, this.isChecked = false});
}

import 'package:flutter/material.dart';
import 'package:login_app/add_task.dart';
import 'package:login_app/chat_page.dart';
import 'package:login_app/prfile.dart';
import 'package:login_app/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ListItem> tasks = [];

  // Function to open AddTask dialog
  void _showAddTaskDialog() async {
    final newTask = await showDialog<ListItem>(
      context: context,
      builder: (context) => AddTask(), // Show AddTask dialog
    );

    if (newTask != null) {
      setState(() {
        tasks.add(newTask); // Add the task to the list if it's not null
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Task Management",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                child: Icon(
                  Icons.person,
                  color: Colors.green,
                  size: 30,
                ),
              )
            ],
          ),
          SizedBox(
              height: 70,
              child: Card(
                elevation: 10,
                margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.greenAccent, Colors.green],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //image
                      Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/chat_bot.png"),
                                fit: BoxFit.cover,
                              ))),
                      SizedBox(width: 20),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatPage()));
                          },
                          child: Text(
                            "Need Any Help ? ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Card(
                  elevation: 10,
                  color: const Color.fromARGB(255, 131, 226, 135),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                            height: 5,
                          ),
                          Text(
                            "Add Your Tasks Here",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: _showAddTaskDialog,
                            child: Icon(
                              Icons.add_circle_outline_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: TaskBar(
                        tasks: tasks,
                      )),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}

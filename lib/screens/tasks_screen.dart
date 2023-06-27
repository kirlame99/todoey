import 'package:flutter/material.dart';
import 'package:star_menu/star_menu.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';
import '../objects/tasks_list.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: MaterialButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => AddTaskScreen(),
              );
            },
            shape: CircleBorder(),
            color: Colors.lightBlueAccent,
            height: 50,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 35,
            ),
            elevation: 5,
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(25, 40, 40, 0),
                child: RadialMenu(),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Todoey',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                        Provider.of<TasksList>(context).taskCount > 0
                            ? '${Provider.of<TasksList>(context).taskCount} Tasks'
                            : 'No Task',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ))
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.fromLTRB(0, 30, 30, 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: TaskList(),
                ),
              ),
            ],
          ),
        ));
  }
}

class RadialMenu extends StatelessWidget {
  const RadialMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksList>(builder: (context, taskData, child) {
      return StarMenu(
        params: StarMenuParameters.arc(context, ArcType.quarterBottomRight,
            radiusX: 125, radiusY: 150),
        items: [
          MenuItem(icon: Icons.done_all, action: () {
            taskData.checkAll();
          },),
          MenuItem(icon: Icons.remove_done, action: () {
            taskData.uncheckAll();
          },),
          MenuItem(icon: Icons.delete_forever, action: () {
            taskData.clearList();
          },)
        ],
        child: MaterialButton(
          onPressed: () {},
          color: Colors.white,
          height: 60,
          shape: CircleBorder(),
          child: Icon(Icons.list, color: Colors.lightBlueAccent, size: 45),
        ),
      );
    });
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final void Function() action;
  const MenuItem({
    required this.icon,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: action,
      shape: CircleBorder(),
      color: Color.fromARGB(211, 255, 255, 255),
      height: 40,
      elevation: 5,
      child: Icon(
        icon,
        color: Colors.lightBlueAccent,
      ),
    );
  }
}

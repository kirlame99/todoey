import 'package:flutter/material.dart';
import 'task_tile.dart';
import '../objects/tasks_list.dart';
import 'package:provider/provider.dart';
import 'package:star_menu/star_menu.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksList>(builder: (context, taskData, child) {
      return ListView.builder(
        itemCount: taskData.taskCount,
        itemBuilder: (context, index) {
          return TaskTile(
            task: taskData
                .tasksList[index]
                .taskDescription,
            checked:
                taskData.tasksList[index].isCompleted,
            updateTileState: (bool? isChecked) {
              Provider.of<TasksList>(context, listen: false).toggleDone(index);
            },
            removeTile: () {
              Provider.of<TasksList>(context, listen: false)
                  .removeFromList(index);
            },
          );
        },
      );
    });
  }
}

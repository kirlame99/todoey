import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../objects/tasks_list.dart';
import '../objects/task.dart';

 String? newTask;

class AddTaskScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: Color(0xFF757575),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Add Task',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 30,
                    )),
                TextField(
                  //controller: controller,
                  onChanged: (value) {
                    newTask = value;
                    //print('CHANGE!!!!!!! $newTask');
                  },
                  //enabled: true,
                  textAlign: TextAlign.center,
                  autofocus: true,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlueAccent,
                        width: 3,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    //print('NOUVELLE TACHE !!!!!! $newTask');
                    if(newTask != null){
                      Provider.of<TasksList>(context, listen: false).addToList(Task(taskDescription: newTask!));
                      Navigator.pop(context);
                    }
                    //controller.clear();
                    
                  },
                  color: Colors.lightBlueAccent,
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  height: 50,
                )
              ],
            ),
          )),
    );
  }
}

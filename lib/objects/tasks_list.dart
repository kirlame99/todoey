import 'package:flutter/material.dart';
import 'task.dart';

class TasksList extends ChangeNotifier{

  List<Task> tasksList = [
    Task(taskDescription: 'buy apples'),
    Task(taskDescription: 'buy pizzas'),
    Task(taskDescription: 'buy soap'),
    Task(taskDescription: 'go to the gym')
  ];

  void addToList(Task newTask){
    tasksList.add(newTask);
    notifyListeners();
  }

  void toggleDone(int index){
    tasksList[index].toggleDone();
    notifyListeners();
  }

  void removeFromList(int index){
    tasksList.removeAt(index);
    notifyListeners();
  }

  void clearList(){
    tasksList.clear();
    notifyListeners();
  }

  void checkAll(){
    for (Task task in tasksList){
      task.isCompleted = true;
    }
    notifyListeners();
  }

  void uncheckAll(){
    for (Task task in tasksList){
      task.isCompleted = false;
    }
    notifyListeners();
  }

  int get taskCount {
    return tasksList.length;
  }

}
class Task{

  final String taskDescription;
  bool isCompleted;

  Task({
    required this.taskDescription,
    this.isCompleted= false,
  });

  void toggleDone(){
    isCompleted = !isCompleted;
  }

}
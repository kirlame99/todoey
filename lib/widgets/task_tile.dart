import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String task;
  final bool checked;
  final void Function(bool?) updateTileState;
  final void Function() removeTile;

  const TaskTile({
    required this.task,
    required this.updateTileState,
    required this.removeTile,
    this.checked = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: MaterialButton(
        onPressed: removeTile,
        shape: CircleBorder(),
        color: Colors.lightBlueAccent,
        height: 25,
        child: Icon(
              Icons.remove,
              color: Colors.white,
              size: 20,
            )
      ),
      title: Text(
        task,
        style: TextStyle(
          decoration:
              checked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: ListCheckBox(
        checkBoxState: checked,
        toggleCheckBox: updateTileState,
      ),
    );
  }
}

class ListCheckBox extends StatelessWidget {
  const ListCheckBox({
    super.key,
    required this.checkBoxState,
    required this.toggleCheckBox,
  });

  final bool checkBoxState;
  final void Function(bool?)? toggleCheckBox;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkBoxState,
      onChanged: toggleCheckBox,
      side: BorderSide(
        color: Colors.black,
        width: 2,
      ),
    );
  }
}

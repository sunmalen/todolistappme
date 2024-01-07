import 'package:flutter/material.dart';
import '../models/task_model.dart';

class PopupMenu extends StatelessWidget {
  final VoidCallback cancelOrDeleteCallback;
  final Task task;
  final VoidCallback  editTaskCallback;
  final VoidCallback  restoreTaskCallback;


  const PopupMenu({
        Key? key,
    required this.task,
    required this.cancelOrDeleteCallback,
    required this.editTaskCallback,
    required this. restoreTaskCallback,
  }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDeleted == false ? ((context) => [
        PopupMenuItem(
          onTap: null,
          child: TextButton.icon(
              onPressed: editTaskCallback,
              icon: const Icon(Icons.edit,color:Colors.lightBlueAccent),
              label: const Text('Edit',style: TextStyle(color:Colors.black))
          ),
        ),
        PopupMenuItem(
          onTap: null,
          child: TextButton.icon(
              onPressed: cancelOrDeleteCallback,
              icon: const Icon(Icons.delete,color: Colors.red),
              label: const Text('Delete',style: TextStyle(color:Colors.red))
          ),

        ),

      ]):(context) =>[
        PopupMenuItem(
          onTap: restoreTaskCallback,
          child: TextButton.icon(
              onPressed: null,
              icon: const Icon(Icons.restore_from_trash,color: Colors.lightBlueAccent,),
              label: const Text('Restore',style: TextStyle(color:Colors.black))
          ),

        ),
        PopupMenuItem(
            onTap: null,
            child: TextButton.icon(
            onPressed: cancelOrDeleteCallback,
            icon: const Icon(Icons.delete_forever,color: Colors.red,),
            label: const Text('Delete Forever',style: TextStyle(color:Colors.red))
        ),
        ),

      ],);
  }
}

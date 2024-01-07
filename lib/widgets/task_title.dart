import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todouserapp/blocs/bloc/tasks_bloc.dart';
import 'package:todouserapp/blocs/bloc/tasks_event.dart';
import 'package:todouserapp/widgets/popup_menu.dart';
import '../models/task_model.dart';
import '../screens/edit_task_screen.dart';

class TaskTitle extends StatelessWidget{
  const TaskTitle({
    Key? key,
    required this.task,
}):super(key: key);
  final Task task;

  void _removeOrDeleteTask(BuildContext ctx,Task task){
    task.isDeleted! ?
    ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemoveTask(task: task));
  }
  void _editTask(BuildContext context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context)=> SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child:  EditTaskScreen(oldTask: task),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Padding(
     padding: const EdgeInsets.only(left: 0.0),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              activeColor: Colors.lightBlueAccent,
              checkColor: Colors.white,
              value: task.isDone,
              onChanged: task.isDeleted == false ?
                  (value){
                context.read<TasksBloc>().add(UpdateTask(task: task));
              }
                  : null,
            ),
            const SizedBox(width: 15),
            Text(
              task.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 15,
                  decoration: task.isDone!? TextDecoration.lineThrough: null,fontWeight: FontWeight.bold
              ),
            ),
          ],
         ),
        Row(
          children: [
          PopupMenu(
            task: task,
            cancelOrDeleteCallback: ()=>
                _removeOrDeleteTask(context, task),
            editTaskCallback:(){
              Navigator.of(context).pop();
              _editTask(context);
            } ,
          restoreTaskCallback:()=> context.read<TasksBloc>().add(RestoreTask(task: task)),
          ),

        ],
      ),
       ],
     ),
   );
  }
}




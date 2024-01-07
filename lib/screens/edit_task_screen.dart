import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bloc/tasks_bloc.dart';
import '../blocs/bloc/tasks_event.dart';
import '../models/task_model.dart';
class EditTaskScreen extends StatelessWidget {
  final Task oldTask;
  const EditTaskScreen({Key? key,required this.oldTask}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleControler = TextEditingController(text: oldTask.title);
    TextEditingController descriptionControler = TextEditingController(text: oldTask.description);
    return Container(
      padding: const EdgeInsets.only(top: 10,bottom: 14),
      child: Column(children: [
        const Text('Edit Task',
          style: TextStyle(fontSize: 20),),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            autofocus: true,
            controller: titleControler,
            decoration: const InputDecoration(
              label: Text('Title',style: TextStyle(color:Colors.lightBlueAccent)),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            autofocus: true,
            controller: descriptionControler,
            maxLines: 3,
            decoration: const InputDecoration(
              label: Text('description',style: TextStyle(color:Colors.lightBlueAccent)),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: ()=> Navigator.pop(context),
              child: const Text('cancel',style: TextStyle(color:Colors.red)),
            ),
            ElevatedButton(
                onPressed: (){
                  var editedtask = Task(
                      title: titleControler.text,
                      id: oldTask.id,
                      isDone: false,
                      description: descriptionControler.text

                  );
                  context.read<TasksBloc>().add(EditTask(
                      oldTask: oldTask,
                      newTask: editedtask,));
                  Navigator.pop(context);
                },
                child: const Text('save',style: TextStyle(color:Colors.lightBlueAccent)))
          ],
        ),

      ],),
    );
  }
}


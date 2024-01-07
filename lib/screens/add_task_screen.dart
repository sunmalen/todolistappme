import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todouserapp/services/guid_gen.dart';
import '../blocs/bloc/tasks_bloc.dart';
import '../blocs/bloc/tasks_event.dart';
import '../models/task_model.dart';
class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  TextEditingController titleControler = TextEditingController();
  TextEditingController descriptionControler = TextEditingController();
    return Container(
      padding: const EdgeInsets.only(top: 10,bottom: 14),
      child: Column(children: [
        const Text('Add New',
          style: TextStyle(fontSize: 20),),
        const SizedBox(
          height: 8,
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
        const SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            autofocus: true,
            maxLines: 3,
            controller: descriptionControler,
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
                  var task = Task(title: titleControler.text, id: GUIDGen.generate(),description: descriptionControler.text
                  );
                  context.read<TasksBloc>().add(AddTask(task: task));
                  Navigator.pop(context);
                },
                child: const Text('Add',style: TextStyle(color:Colors.lightBlueAccent)))
          ],
        ),

      ],),
    );
  }
}


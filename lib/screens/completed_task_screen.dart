import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todouserapp/blocs/bloc/tasks_bloc.dart';
import 'package:todouserapp/blocs/bloc/tasks_state.dart';
import 'package:todouserapp/screens/pending_tasks_screen.dart';
import 'package:todouserapp/widgets/tasks_list.dart';
import '../models/task_model.dart';



class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({Key? key}) : super(key: key);
  static const id =  'tasks_screen';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<TasksBloc,TasksState>(
      builder: (context,state){
        List<Task> tasksList = state.completedTasks;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent,
            title: Center(child:  Text("(${tasksList.length})Completed",style: TextStyle(color: Colors.white),)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TasksList(tasksList: tasksList),
          ),
        );
      },
    );

  }
}


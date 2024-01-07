import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todouserapp/blocs/bloc/tasks_bloc.dart';
import 'package:todouserapp/blocs/bloc/tasks_state.dart';
import 'package:todouserapp/widgets/tasks_list.dart';
import '../models/task_model.dart';
class PendingTasksScreen extends StatefulWidget {
const PendingTasksScreen({Key? key}) : super(key: key);
static const id = 'pending_tasks_screen';
  @override
  State<PendingTasksScreen> createState() => _PendingTasksScreenState();
}

class _PendingTasksScreenState extends State<PendingTasksScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<TasksBloc,TasksState>(
      builder: (context,state){
        List<Task> tasksList = state.pendingTasks;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent,
            title:  Center(child: Text("(${tasksList.length})Pending",style: TextStyle(color: Colors.white),
            ),
            ),
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


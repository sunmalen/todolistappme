import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todouserapp/blocs/bloc/tasks_event.dart';
import 'package:todouserapp/screens/pending_tasks_screen.dart';
import '../blocs/bloc/tasks_bloc.dart';
import '../blocs/bloc/tasks_state.dart';
import '../widgets/tasks_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);
  static const  id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc,TasksState>(
      builder: (context, state){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent,
            title:  Center(child: Text("(${state.removedTasks.length})Bin",style: TextStyle(color: Colors.white),)),
          ),
          body:   Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: ()=> context.read<TasksBloc>()
                    .add(DeleteAllTasks()),
                child: const Chip(
                  label: Text('Deleted all takes',style: TextStyle(color: Colors.red)),
                ),
              ),
              TasksList(tasksList: state.removedTasks)
            ],
          ),
        );
      },

    );
  }
}

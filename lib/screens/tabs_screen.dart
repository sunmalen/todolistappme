import 'package:flutter/material.dart';
import 'package:todouserapp/screens/add_task_screen.dart';
import 'package:todouserapp/screens/pending_tasks_screen.dart';
import 'package:todouserapp/screens/recycle_bin_screen.dart';
import 'completed_task_screen.dart';

class TabsScreen extends StatefulWidget {
 const TabsScreen({Key? key}) : super(key: key);
  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  static const bottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedIconTheme: IconThemeData(
      color: Colors.green,
      size: 24,
    ),
    selectedLabelStyle: TextStyle(
      color: Colors.green,
      fontSize: 12,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.white,
      size: 24,
    ),
    unselectedLabelStyle: TextStyle(
      color: Colors.white,
      fontSize: 12,
    ),

    // Uncommenting this changes the color of the title but not the icon
//    selectedItemColor: Colors.deepPurple,
//    unselectedItemColor: Colors.deepPurpleAccent,
  );

  final List<Map<String, dynamic>> _pageDetails = [
    {
      'pageName': const PendingTasksScreen(), 'title': 'Pending Task'
    },
    {
      'pageName': const CompletedTasksScreen(), 'title': 'Completed Task'
    },
    {
      'pageName': const RecycleBin(), 'title': 'Bin'
    },
  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context)=> SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: const AddTaskScreen(),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton:_selectedPageIndex == 0 ? FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () => _addTask(context),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ):null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index){
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon:Icon(Icons.padding_outlined),
              label: 'Pending Tasks',
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.done),
              label: 'Completed Tasks',

          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.delete),
              label: 'Bin'
          ),
        ],
        selectedItemColor: Colors.lightBlueAccent,
      ),
    );
  }
}

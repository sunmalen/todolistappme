import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todouserapp/screens/pending_tasks_screen.dart';
import 'package:todouserapp/screens/tabs_screen.dart';

import '../screens/recycle_bin_screen.dart';

class AppRouter{
  Route? onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case RecycleBin.id:
        return MaterialPageRoute(
            builder: (_) => const RecycleBin());
      case TabsScreen.id:
        return MaterialPageRoute(
            builder: (_)=> const TabsScreen());
      case RecycleBin.id:
        return MaterialPageRoute(
            builder: (_) => const PendingTasksScreen());
      default:
        return null;
    }
  }
}
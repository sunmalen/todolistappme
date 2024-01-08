# todouserapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# TodoList App
- **The TodoList app:** is a simple task management application that allows users to create, delete, edit, restore, and permanently delete tasks.

# Features
- **Create:** Add new tasks to the list with a title and optional description.
- **Delete:** Remove tasks from the list. Deleted tasks can be restored or permanently deleted.
- **Edit:** Modify the title or description of existing tasks.
- **Restore:** Recover previously deleted tasks and restore them to the active list.
- **Delete Forever:** Permanently remove tasks that have been deleted and cannot be restored.

# Store data 
- **path_provider:**  is a Dart package that provides a simple way to access platform-specific file system locations. It is commonly used to obtain directories for storing and retrieving files on the device.
- **hydrated_bloc:** is adds the capability of persistent state storage and restoration to bloc, allowing you to save and load the state of your application even if the app is closed and reopened.

# State management
- **flutter_bloc:** (Business Logic Component)
- **BlocBuilder:**  A widget provided by the flutter_bloc package that simplifies UI updates based on the state emitted by the BLoC. It automatically rebuilds the UI when the BLoC emits a new state.
- **equatable:** is often used in conjunction with state management libraries, such as the bloc library, to make it easier to compare and determine if two objects are equal.

# Testing
- **This app Using Unit tests:**

# This App Using CI (continuous integration)
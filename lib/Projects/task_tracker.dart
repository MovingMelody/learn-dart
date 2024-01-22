/*
* Created on 17 January 2024
* @author Sai Sumanth
*/

import 'dart:io';

///
/// Extension methods on Map
///
extension GetByKeyIndex on Map<String, bool> {
  String keyAtIndex({required int index}) => keys.elementAt(index);

  int indexOf({required String key}) => keys.toList().indexOf(key);
}

///
/// 🏁 entry point
///
void main() {
  final tasksMap = <String, bool>{};

  while (true) {
    print('\nTask Tracker Menu:');
    print('1. Add Task');
    print('2. Mark Task as Complete');
    print('3. View Tasks');
    print('4. Remove Completed Tasks');
    print('5. Exit');

    stdout.write('Enter your choice (1-5): ');
    final userChoice = int.tryParse(stdin.readLineSync() ?? '');

    if (userChoice == null || userChoice < 1 || userChoice > 5) {
      print('Invalid choice. Please enter a number between 1 and 5.');
      continue;
    }

    switch (userChoice) {
      case 1:
        addNewTask(tasksMap);
      case 2:
        markTaskAsComplete(tasksMap);
      case 3:
        viewAllTasks(tasksMap);
      case 4:
        removeCompletedTasks(tasksMap);
      case 5:
        print('Exiting Application. See Ya!');
        exit(0);
      default:
    }
  }
}

void markTaskAsComplete(Map<String, bool> tasks) {
  viewAllTasks(tasks);

  stdout.write('Enter the Id of the task to mark as complete: ');

  /// get task Id from User (index)
  final indexOfTask = int.tryParse(stdin.readLineSync() ?? '');

  if (indexOfTask != null && indexOfTask >= 0 && indexOfTask < tasks.length) {
    try {
      tasks[tasks.keyAtIndex(index: indexOfTask)] = true;
      print(
          'Marked task "${tasks.keyAtIndex(index: indexOfTask)}" as complete');
    } catch (e) {
      print(e);
    }
  } else {
    print('Invalid index. Please enter a valid index.');
  }
}

void addNewTask(Map<String, bool> tasksMap) {
  stdout.write('Enter task description: ');
  final task = stdin.readLineSync() ?? '';
  tasksMap[task] = false;
  print('Task added successfully!');
}

void viewAllTasks(Map<String, bool> tasksMap) {
  if (tasksMap.isEmpty) {
    print('No Tasks Available');
  } else {
    print('\nAdded Tasks List:');
    tasksMap.forEach((key, value) {
      print(
          '${tasksMap.indexOf(key: key)}. $key : ${value == true ? '✅' : '🔲'}');
    });
  }
}

void removeCompletedTasks(Map<String, bool> tasks) {
  final completedTasks = <String>[];
  tasks.forEach((key, value) {
    if (value) {
      completedTasks.add(key);
    }
  });
  if (completedTasks.isEmpty) {
    stdout.write('\n👎🏻 No Completed Tasks Found\n');
    return;
  }
  stdout.write('Removing the following completed Tasks : $completedTasks\n');
  tasks.removeWhere((key, value) => value == true);
  stdout.write('All completed Tasks removed Successfully!');
}

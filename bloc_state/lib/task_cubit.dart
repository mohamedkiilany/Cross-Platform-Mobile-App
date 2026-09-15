import 'package:blocstate/model.dart';
import 'package:blocstate/task_db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCubit extends Cubit<List<Task>> {
  TaskCubit() : super([]) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    final tasks = await TaskDb.getTasks();
    emit(tasks);
  }

  Future<void> addTask(Task task) async {
    final newList = [...state, task];
    emit(newList);
    await TaskDb.addOrUpdateTask(task);
  }

  Future<void> deleteTask(Task task) async {
    final newList = [...state];
    newList.remove(task);
    emit(newList);
    await TaskDb.deleteTask(task.id);
  }

  Future<void> deleteAll() async {
    emit([]);
    await TaskDb.clearTask();
  }

  Future<void> setTaskCompleted(Task task, bool isCompleted) async {
    final updatedTask = task.copyWith(isCompleted: isCompleted);

    emit([
      for (final currentTask in state)
        if (currentTask.id == task.id) updatedTask else currentTask,
    ]);

    await TaskDb.addOrUpdateTask(updatedTask);
  }
}

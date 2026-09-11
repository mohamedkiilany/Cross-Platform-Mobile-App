import 'package:blocstate/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCubit extends Cubit<List<Object>> {
  TaskCubit() : super([]);

  void addTask(Task task) {
    final newList = [...state, task];
    emit(newList);
  }

  void deleteTask(Task task) {
    final newList = [...state];
    newList.remove(task);
    emit(newList);
  }

  void deleteAll() {
    emit([]);
  }

  void addToCompletedTask(Taskcomplete completedTasks) {
    final newList = [...state, completedTasks];
    emit(newList);
  }
}

import 'package:blocstate/model.dart';
import 'package:blocstate/task_adapter.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskDb {
  static const boxName = "Tasks";

  static Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(TaskAdapter());
    } else {
      await Hive.openBox<Task>(boxName);
    }
  }

  static Future<void> addOrUpdateTask(Task task) async {
    final box = await Hive.openBox<Task>(boxName);
    await box.put(task.id, task);
  }

  static Future<void> deleteTask(String id) async {
    final box = await Hive.openBox<Task>(boxName);
    await box.delete(id);
  }

  static Future<void> clearTask() async {
    final box = await Hive.openBox<Task>(boxName);
    await box.clear();
  }

  static Future<List<Task>> getTasks() async {
    final box = await Hive.openBox<Task>(boxName);
    return await box.values.toList();
  }
}

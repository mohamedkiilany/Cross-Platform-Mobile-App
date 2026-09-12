import 'package:blocstate/model.dart';
import 'package:blocstate/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTasksPage extends StatelessWidget {
  const MyTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "My Tasks",
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Row(
              children: [
                const SizedBox(width: 8),
                const Icon(Icons.pending_actions, size: 35),
                const SizedBox(width: 8),
                const Text(
                  "Pending Tasks",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                BlocBuilder<TaskCubit, List<Object>>(
                  builder: (context, state) {
                    final pendingTasks = state.whereType<Task>().toList();
                    return CircleAvatar(
                      child: Text(pendingTasks.length.toString()),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 18),

            BlocBuilder<TaskCubit, List<Object>>(
              builder: (context, state) {
                final pendingTasks = state.whereType<Task>().toList();
                return Expanded(
                  child: ListView.builder(
                    itemCount: pendingTasks.length,
                    itemBuilder: (context, index) {
                      final taskItem = pendingTasks[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        child: Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(25),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 1,
                              vertical: 10,
                            ),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              leading: const CircleAvatar(
                                radius: 25,
                                child: Icon(Icons.hourglass_empty),
                              ),
                              title: Text(
                                taskItem.title,
                                style: const TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                taskItem.description,
                                style: const TextStyle(fontSize: 18),
                              ),

                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      context.read<TaskCubit>().deleteTask(
                                        taskItem,
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Checkbox(
                                    value: false,
                                    onChanged: (value) {
                                      context
                                          .read<TaskCubit>()
                                          .addToCompletedTask(
                                            Taskcomplete(
                                              title: taskItem.title,
                                              description: taskItem.description,
                                            ),
                                          );
                                      context.read<TaskCubit>().deleteTask(
                                        taskItem,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<TaskCubit, List<Object>>(
                builder: (context, state) {
                  final completedTasks = state
                      .whereType<Taskcomplete>()
                      .toList();
                  return Row(
                    children: [
                      const Icon(Icons.check_box),
                      const SizedBox(width: 8),
                      const Text(
                        "Completed Tasks ",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 3),
                      CircleAvatar(
                        child: Text(completedTasks.length.toString()),
                      ),
                    ],
                  );
                },
              ),
            ),
            BlocBuilder<TaskCubit, List<Object>>(
              builder: (context, state) {
                final completedTasks = state.whereType<Taskcomplete>().toList();
                return Expanded(
                  child: ListView.builder(
                    itemCount: completedTasks.length,
                    itemBuilder: (context, index) {
                      final completedItem = completedTasks[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        child: Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(25),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 1,
                              vertical: 10,
                            ),
                            child: ListTile(
                              leading: Icon(Icons.check_circle, size: 35),
                              title: Text(
                                completedItem.title,
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                completedItem.description,
                                style: const TextStyle(fontSize: 18),
                              ),
                              trailing: Checkbox(
                                value: true,
                                onChanged: (value) {
                                  context.read<TaskCubit>().addTask(
                                    Task(
                                      title: completedItem.title,
                                      description: completedItem.description,
                                    ),
                                  );
                                  context.read<TaskCubit>().deleteCompletedTask(
                                    completedItem,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18, right: 20),
                child: FloatingActionButton(
                  onPressed: () {
                    context.read<TaskCubit>().deleteAll();
                  },
                  backgroundColor: const Color(0xFFC7B3E8),
                  foregroundColor: const Color(0xFF4B3C66),
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                  child: const Icon(Icons.delete_outline_rounded, size: 32),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

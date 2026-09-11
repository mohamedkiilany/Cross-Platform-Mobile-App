import 'package:blocstate/model.dart';
import 'package:blocstate/my_tasks.dart';
import 'package:blocstate/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  static const _background = Color(0xFFFFF8FF);
  static const _ink = Color(0xFF211F25);
  static const _purple = Color(0xFF6F52B5);
  static const _blue = Color(0xFF2196F3);
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  // int taskCount = 100;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: _background,
      title: const Text(
        "Add Task",
        style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    ),
    backgroundColor: _background,
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            const Icon(Icons.task_alt_rounded, color: _blue, size: 90),
            const SizedBox(height: 10),
            const Text(
              'Create a New Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _ink,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Add a title and description for your task',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF827D83), fontSize: 18),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: titleController,
                style: const TextStyle(color: _ink, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Task Title",

                  hintStyle: const TextStyle(
                    color: Color(0xFF5B5660),
                    fontSize: 25,
                  ),
                  prefixIcon: const Icon(
                    Icons.title_rounded,
                    color: Color(0xFF514D56),
                    size: 35,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20),
                      right: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: descriptionController,
                maxLines: 4,

                decoration: InputDecoration(
                  labelText: 'Task description',
                  labelStyle: const TextStyle(
                    color: Color(0xFF5B5660),
                    fontSize: 20,
                  ),
                  alignLabelWithHint: true,

                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(bottom: 70),
                    child: Icon(
                      Icons.description_rounded,
                      color: Color(0xFF514D56),
                      size: 35,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20),
                      right: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (titleController.text.isEmpty ||
                      descriptionController.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Error"),
                          content: const Text(
                            "Please enter a task title and task description",
                            style: TextStyle(fontSize: 15),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    context.read<TaskCubit>().addTask(
                      Task(
                        title: titleController.text,
                        description: descriptionController.text,
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Task: ${titleController.text} added successfully!",
                        ),
                        duration: Duration(seconds: 1),
                      ),
                    );
                    titleController.clear();
                    descriptionController.clear();
                  }
                },
                icon: const Icon(Icons.add, size: 32),
                label: const Text('Add Task'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: _purple,
                  backgroundColor: const Color(0xFFF8F3FA),
                  elevation: 2,

                  textStyle: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 7),
            Container(
              width: 300,
              // height: 200,
              padding: const EdgeInsets.symmetric(vertical: 25),
              decoration: BoxDecoration(
                color: const Color(0xFFFBF7FE),
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 6,
                    offset: Offset(0, 7),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Icon(Icons.checklist_rounded, color: _blue, size: 35),
                  const SizedBox(height: 3),
                  const Text(
                    'Tasks Added',
                    style: TextStyle(color: _ink, fontSize: 20),
                  ),
                  const SizedBox(height: 2),
                  BlocBuilder<TaskCubit, List<Object>>(
                    builder: (context, state) {
                      final pendingTasks = state.whereType<Task>().toList();
                      return Text(
                        pendingTasks.length.toString(),
                        style: const TextStyle(
                          color: _ink,
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 390,
              height: 60,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MyTasksPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.view_list_rounded, size: 25),
                label: const Text('View All Tasks'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: _purple,
                  side: const BorderSide(color: Color(0xFF817C85), width: 1.9),

                  textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

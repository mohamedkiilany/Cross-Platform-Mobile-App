import 'package:depi_project/model.dart';
import 'package:flutter/material.dart';

class CallsWidget extends StatefulWidget {
  final Phones phone;
  const CallsWidget({super.key, required this.phone});

  @override
  State<CallsWidget> createState() => _CallsWidgetState();
}

class _CallsWidgetState extends State<CallsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: phones.length,
        itemBuilder: (context, index) {
          return ListTile(
            trailing: const Icon(Icons.call, color: Colors.green),
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: const Color.fromARGB(255, 180, 128, 222),
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(phones[index].name),
            subtitle: Text(phones[index].subtitle),
          );
        },
      ),
    );
  }
}

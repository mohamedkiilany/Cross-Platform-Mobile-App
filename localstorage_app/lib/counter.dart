import 'package:flutter/material.dart';
import 'package:localstorage_app/counter_db.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

int count = 0;

class _CounterAppState extends State<CounterApp> {
  @override
  void initState() {
    super.initState();
    loadCount();
  }

  Future<void> loadCount() async {
    count = await CounterDb().getCount();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const actionStyle = TextStyle(
      color: Colors.teal,
      fontSize: 30,
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.underline,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 2,
        title: const Text(
          'Counter App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 12),
            Text(
              count.toString(),
              style: const TextStyle(
                color: Colors.teal,
                fontSize: 48,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 36),
            TextButton(
              onPressed: () {
                setState(() {
                  count++;
                  CounterDb().setCount(count);
                });
              },
              child: const Text('+ Press Me', style: actionStyle),
            ),
            const SizedBox(height: 22),
            TextButton(
              onPressed: () {
                setState(() {
                  count--;
                  CounterDb().setCount(count);
                });
              },
              child: const Text('- Press Me', style: actionStyle),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count = 0;
            CounterDb().setCount(count);
          });
        },
        backgroundColor: Colors.teal,
        tooltip: 'Reset counter',
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}

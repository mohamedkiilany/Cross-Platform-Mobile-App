import 'package:flutter/material.dart';
import 'package:projectapp/cart_provider.dart';
import 'package:projectapp/items_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
       debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: const ItemsScreen(),
      ),
    );
  }
}
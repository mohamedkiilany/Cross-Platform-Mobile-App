import 'package:flutter/material.dart';
import 'package:projectapp/cart_db.dart';
import 'package:projectapp/cart_provider.dart';
import 'package:projectapp/items_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CartDb().initialDatabase();
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

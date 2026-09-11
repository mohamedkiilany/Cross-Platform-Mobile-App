import 'package:flutter/material.dart';
import 'package:projectapp/cart_provider.dart';
import 'package:projectapp/cart_screen.dart';
import 'package:projectapp/model.dart';
import 'package:provider/provider.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  bool isAddedToCart = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Badge(
              label: Text(
                context.watch<CartProvider>().cartItems.length.toString(),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white
                ),
              ),
              isLabelVisible: context.watch<CartProvider>().cartItems.isNotEmpty,
              child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );
              },
              icon: const Icon(Icons.shopping_cart,size: 30),
            ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 40,
              child: Text(
                "${items[index].id}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              items[index].name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              items[index].price.toString(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                context.read<CartProvider>().addToCart(items[index]);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${items[index].name} added to cart"),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              child:
                  context.watch<CartProvider>().cartItems.contains(items[index])
                  ? const Icon(
                      Icons.check,
                      color: Color.fromARGB(255, 21, 0, 247),
                    )
                  : const Text(
                      'ADD',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:projectapp/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return ListView.builder(
            itemCount: cartProvider.cartItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  child: Text(
                    "${cartProvider.cartItems[index].id}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  cartProvider.cartItems[index].name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  cartProvider.cartItems[index].price.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    cartProvider.removeFromCart(cartProvider.cartItems[index]);
                  },
                  icon: Icon(Icons.delete, color: Colors.red, size: 35),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Total: \$${context.watch<CartProvider>().cartItems.fold<double>(0, (total, product) => total + product.price)}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 15,),
          ElevatedButton(
            onPressed: () {
              context.read<CartProvider>().clearCart();
            },
            child: const Text('Clear Cart',style: TextStyle(fontSize: 20),),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}

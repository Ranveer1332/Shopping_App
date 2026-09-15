import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/cart_provider.dart';

import 'global_variable.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(Provider.of<CartProvider>(context).cart);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
                final cartItem = cart[index];

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                    radius: 30,
                  ),
                  trailing: IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.delete,color: Colors.red,)
                  ),
                  title: Text(
                    cartItem['title'].toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  subtitle: Text('Size : ${cartItem['size']}'),
                );

      }),
    );
  }
}

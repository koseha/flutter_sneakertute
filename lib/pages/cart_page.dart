import 'package:flutter/material.dart';
import 'package:flutter_sneakertute/components/cart_item.dart';
import 'package:flutter_sneakertute/models/cart.dart';
import 'package:flutter_sneakertute/models/shoe.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              const Text(
                'My Cart',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: value.getCart().length,
                  itemBuilder: (context, index) {
                    // get individual shoe
                    Shoe shoe = value.getCart()[index];

                    // return the cart item
                    return CartItem(shoe: shoe);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

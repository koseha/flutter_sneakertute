import 'package:flutter/material.dart';
import 'package:flutter_sneakertute/components/shoe_tile.dart';
import 'package:flutter_sneakertute/models/cart.dart';
import 'package:flutter_sneakertute/models/shoe.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addToCart(shoe);

    // alert the user, shoe successfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Success'),
        content: Text('Shoe successfully added to cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        return Column(
          children: [
            // search bar
            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Search', style: TextStyle(color: Colors.grey)),
                  Icon(Icons.search, color: Colors.grey),
                ],
              ),
            ),

            // message
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Text(
                'everyone flies... some fly longer than others',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),

            // hot picks
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Hot Picks 🔥',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  Shoe shoe = value.getShoes()[index];

                  return ShoeTile(shoe: shoe, onTap: () => addShoeToCart(shoe));
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Divider(color: Colors.white),
            ),
          ],
        );
      },
    );
  }
}

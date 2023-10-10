import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/components/show_tile.dart';
import '/models/cart.dart';
import '/models/shoe.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addCartItem(shoe);

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Item Successfully Added"),
        content: Text('Check Your Cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, index) => Column(
        children: [
          // Search bar
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "search",
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),

          // Message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "Everyone flies, some fly longer than others!",
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ),

          // Hot picks
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Hot Picks 🔥",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  "see all",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Shoes
          Expanded(
            child: ListView.builder(
              itemCount: cart.getShoeList().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Shoe shoe = cart.getShoeList()[index];
                return ShoeTile(
                  shoe: shoe,
                  onTap: () => addShoeToCart(shoe),
                );
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

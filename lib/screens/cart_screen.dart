import 'package:e_com/components/cart_item.dart';
import 'package:e_com/models/cart.dart';
import 'package:e_com/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "MY Cart",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cart.getCartList().length,
                itemBuilder: (context, index) {
                  Shoe individualShoe = cart.getCartList()[index];
      
                  return CartItem(
                    shoe: individualShoe,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

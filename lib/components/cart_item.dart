import "package:e_com/models/cart.dart";
import "package:e_com/models/shoe.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.shoe});

  final Shoe shoe;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void _removeItem() {
    Provider.of<Cart>(context, listen: false).removeCartItem(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(
          widget.shoe.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        subtitle: Text("\$${widget.shoe.price}"),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: _removeItem,
        ),
      ),
    );
  }
}

import 'package:e_com/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // List of all shoes
  List<Shoe> shoeShop = [
    Shoe(
      name: "KD 1",
      price: "300",
      imagePath: "lib/images/black.png",
      description:
          "Consectetur quis placeat nihil. Explicabo labore corrupti ut doloribus itaque corporis distinctio. Praesentium quibusdam quisquam ipsam",
    ),
    Shoe(
      name: "KD 2",
      price: "450",
      imagePath: "lib/images/blue.png",
      description:
          "Consectetur quis placeat nihil. Explicabo labore corrupti ut doloribus itaque corporis distinctio. Praesentium quibusdam quisquam ipsam",
    ),
    Shoe(
      name: "KD4",
      price: "600",
      imagePath: "lib/images/green.png",
      description:
          "Consectetur quis placeat nihil. Explicabo labore corrupti ut doloribus itaque corporis distinctio. Praesentium quibusdam quisquam ipsam",
    ),
    Shoe(
      name: "KD 2",
      price: "300",
      imagePath: "lib/images/orange.png",
      description:
          "Consectetur quis placeat nihil. Explicabo labore corrupti ut doloribus itaque corporis distinctio. Praesentium quibusdam quisquam ipsam",
    ),
  ];

  // items in user cart
  List<Shoe> cartItem = [];

  // get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getCart() {
    return cartItem;
  }

  // add item to cart
  void addCartItem(Shoe shoe) {
    cartItem.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeCartItem(Shoe shoe) {
    cartItem.remove(shoe);
    notifyListeners();
  }
}

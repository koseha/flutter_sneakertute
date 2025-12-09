import 'package:flutter/material.dart';
import 'package:flutter_sneakertute/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoes = [
    Shoe(
      name: 'Nike Air Force 1',
      price: '100',
      imagePath: 'lib/images/nike_shoe_01.png',
      description: 'A comfortable shoe for everyday wear',
    ),
    Shoe(
      name: 'Nike Air Force 2',
      price: '150',
      imagePath: 'lib/images/nike_shoe_02.png',
      description: 'A comfortable shoe for everyday wear',
    ),
    Shoe(
      name: 'Nike Air Force 3',
      price: '200',
      imagePath: 'lib/images/nike_shoe_03.png',
      description: 'A comfortable shoe for everyday wear',
    ),
    Shoe(
      name: 'Nike Air Force 4',
      price: '250',
      imagePath: 'lib/images/nike_shoe_04.png',
      description: 'A comfortable shoe for everyday wear',
    ),
  ];

  // list of items in cart
  List<Shoe> cart = [];

  // get list of shoes for sale
  List<Shoe> getShoes() {
    return shoes;
  }

  // get cart
  List<Shoe> getCart() {
    return cart;
  }

  // add items to cart
  void addToCart(Shoe shoe) {
    cart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(Shoe shoe) {
    cart.remove(shoe);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:riverpod_app/model/product_model.dart';

class ProductRiverpod extends ChangeNotifier {
  List<ProductModel> products = [];
  List<ProductModel> favorites = [];
  List<ProductModel> basketProducts = [];
  double totalPrice = 0;

  void setTotalPrice(ProductModel model) {
    totalPrice += model.price;
  }

  void setFavorite(ProductModel model) {
    if (model.isFavorite) {
      model.isFavorite = false;
      favorites.remove(model);
      notifyListeners();
    } else {
      model.isFavorite = true;
      favorites.add(model);
      notifyListeners();
    }
  }

  void addedBasket(BuildContext context, ProductModel model) {
    basketProducts.add(model);
    setTotalPrice(model);

    final snackBar = SnackBar(
      content: Text(
        'Ürün sepete eklendi!',
        style: TextStyle(color: Colors.black),
      ),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.blue[100],
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void init() {
    for (int i = 0; i < 4; i++) {
      products.add(ProductModel(
          isFavorite: false,
          title: "Xiaomi -Redmi Note ${i + 10} Pro",
          price: 9.999,
          description:
              "108 MP profesyonel sınıf ana kamera 120 Hz FHD+ AMOLED DotDisplay 67 W turbo şarj"));
    }
  }
}

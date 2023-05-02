import 'package:flutter/material.dart';
import 'package:riverpod_app/view/basket/basket.dart';
import 'package:riverpod_app/view/favorite/favorite.dart';
import 'package:riverpod_app/view/home/home.dart';

class BottomNavBarRiverpod extends ChangeNotifier {
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ana Sayfa"),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoriler"),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: "Sepet")
  ];

  int currentIndex = 0;

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners(); //degisikligi gorebilmek icin
  }

  String appBarTitle() {
    switch (currentIndex) {
      case 0:
        return "Ana Sayfa";
      case 1:
        return "Favoriler";
      case 2:
        return "Sepet";
      default:
        return "Boş";
    }
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return Home();
      case 1:
        return Favorite();
      case 2:
        return Basket();
      default:
        return Home();
    }
  }
}

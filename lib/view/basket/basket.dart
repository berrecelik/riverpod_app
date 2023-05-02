import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../riverpod_management.dart';

class Basket extends ConsumerWidget {
  const Basket({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(productRiverpod);

    return Scaffold(
      body: watch.favorites.length == 0
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text("Sepetiniz boş"),
                ),
                SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                    onPressed: () {
                      ref.read(bottomNavBarRiverpod).setCurrentIndex(0);
                    },
                    child: const Text('Ürünlere git'))
              ],
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Sepet',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: watch.basketProducts.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image.asset(
                                            'assets/xiaomi.png',
                                            width: 100,
                                            height: 150,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 30),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                watch.basketProducts[index]
                                                    .title,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                watch.basketProducts[index]
                                                    .description,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Center(
                                                child: Text(
                                                  watch.basketProducts[index]
                                                          .price
                                                          .toString() +
                                                      " TL",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 60),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.blue[100]),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 7,
                                                      ),
                                                      Icon(CupertinoIcons
                                                          .bag_badge_plus),
                                                      SizedBox(
                                                        width: 7,
                                                      ),
                                                      Text(
                                                        "Ekle",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 0.5),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 10)
                                          ]),
                                      child: InkWell(
                                        onTap: () => watch.setFavorite(
                                            watch.basketProducts[index]),
                                        child: Icon(watch.basketProducts[index]
                                                .isFavorite
                                            ? CupertinoIcons.heart_fill
                                            : CupertinoIcons.heart),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          }),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Toplam tutar: ${watch.totalPrice} TL',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                "Sipariş Ver",
                                style: TextStyle(fontSize: 15),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

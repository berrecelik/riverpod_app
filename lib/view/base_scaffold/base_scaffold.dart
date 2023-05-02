import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/components/bottom_nav_bar.dart';
import 'package:riverpod_app/components/riverpod/bottom_nav_bar_riverpod.dart';
import 'package:riverpod_app/riverpod_management.dart';

class BaseScaffold extends ConsumerStatefulWidget {
  const BaseScaffold({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends ConsumerState<BaseScaffold> {
  @override
  void initState() {
    ref.read(productRiverpod).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(bottomNavBarRiverpod);
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: watch.body(),
      appBar: appbarBuild(watch),
    );
  }

  CupertinoNavigationBar appbarBuild(BottomNavBarRiverpod watch) =>
      CupertinoNavigationBar(middle: Text(watch.appBarTitle()));
}

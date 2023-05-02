import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/components/riverpod/bottom_nav_bar_riverpod.dart';

import 'package:riverpod_app/riverpod/product_riverpod.dart';

final bottomNavBarRiverpod =
    ChangeNotifierProvider((ref) => BottomNavBarRiverpod());

final productRiverpod = ChangeNotifierProvider((ref) => ProductRiverpod());

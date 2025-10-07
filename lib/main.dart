import 'package:flutter/material.dart';
import 'package:mini_shop/resources/view_models/navigation_provider.dart';
import 'package:mini_shop/resources/view_models/shopping_cart_provider.dart';
import 'package:mini_shop/widgets/common/routers.dart';
import 'package:mini_shop/widgets/screens/category_detail.dart';
import 'package:mini_shop/widgets/screens/home.dart';
import 'package:mini_shop/widgets/screens/onboarding.dart';
import 'package:mini_shop/widgets/screens/shopping_cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => ShoppingCartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MiniShop',
      home: const Onboarding(),
      routes: {
        Routers.home: (_) => HomeScreen(),
        Routers.categoryDetail: (_) => CategoryDetailScreen(),
        Routers.shoppingCart: (_) => ShoppingCartScreen(),
      },
    );
  }
}

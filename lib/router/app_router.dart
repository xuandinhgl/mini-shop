import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_shop/widgets/common/route.dart';
import 'package:mini_shop/widgets/screens/category_detail.dart';
import 'package:mini_shop/widgets/screens/home.dart';
import 'package:mini_shop/widgets/screens/onboarding.dart';
import 'package:mini_shop/widgets/screens/product_detail.dart';
import 'package:mini_shop/widgets/screens/shopping_cart.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(path: "/", builder: (context, state) => Onboarding()),
      GoRoute(path: RoutePath.home, builder: (context, state) => HomeScreen()),
      GoRoute(
        path: RoutePath.shoppingCart,
        builder: (context, state) => const ShoppingCartScreen(),
      ),
      GoRoute(
        path: RoutePath.categoryDetail,
        builder: (context, state) {
          final categoryId = state.pathParameters['id'];
          return CategoryDetailScreen(categoryId: categoryId!);
        },
      ),
      GoRoute(
        path: RoutePath.productDetail,
        builder: (context, state) {
          final productId = state.pathParameters['id'];
          return ProductDetailScreen(productId: productId!);
        },
      ),
    ],
  );
});

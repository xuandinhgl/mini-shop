import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_shop/resources/view_models/shopping_cart_notifier.dart';
import 'package:mini_shop/widgets/common/route.dart';
import 'package:mini_shop/widgets/common/styles.dart';

class HeaderCart extends ConsumerWidget {
  const HeaderCart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(shoppingCartNotifierProvider);

    return Stack(
      children: [
        IconButton(
          onPressed: () {
            context.push(RoutePath.shoppingCart);
          },
          icon: Icon(Icons.shopping_cart),
        ),
        Positioned(
          right: 5,
          top: 4,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Text(
              cart.count.toString(),
              style: TextStyle(color: Styles.colorBlack10, fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }
}

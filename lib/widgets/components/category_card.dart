import 'package:flutter/material.dart';
import 'package:mini_shop/widgets/common/routers.dart';
import 'package:mini_shop/widgets/common/styles.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(Routers.categoryDetail);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Styles.colorBlack10,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Image.asset("images/image_placeholder.png"),
            const SizedBox(height: 5),
            const Text(
              "Category title",
              style: Styles.textH3Semibold,
              maxLines: 1,
              textAlign: TextAlign.left,
            ),
            const Text(
              "Category subtitle",
              style: Styles.textBody1Medium,
              maxLines: 1,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}

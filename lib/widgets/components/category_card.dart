import 'package:flutter/material.dart';
import 'package:mini_shop/resources/models/category.dart';
import 'package:mini_shop/widgets/common/styles.dart';
import 'package:mini_shop/widgets/screens/category_detail.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CategoryDetailScreen(category: category),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Styles.colorBlack10,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Image.network(
              category.image,
              width: 154,
              height: 154,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 50),
            ),
            const SizedBox(height: 5),
            Text(
              category.name,
              style: Styles.textH3Semibold,
              maxLines: 1,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}

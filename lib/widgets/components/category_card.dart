import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_shop/resources/models/category.dart';
import 'package:mini_shop/widgets/common/styles.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/category/${category.id}');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Styles.colorBlack10,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: category.image,
              width: 154,
              height: 154,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_shop/widgets/common/route.dart';
import 'package:mini_shop/widgets/common/styles.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height / 2.5,
            child: Center(
              child: Image.asset(
                "images/image_placeholder.png",
                width: 130,
                height: 130,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 42, right: 42),
            child: Column(
              children: [
                Text(
                  "Your holiday\nshopping\ndelivered to your home🏕️",
                  style: Styles.textH1Bold,
                ),
                SizedBox(height: 30),
                Text(
                  "There's something for everyone to enjoy with Sweet Shop Favourites",
                  style: Styles.textH3Medium,
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.replace(RoutePath.home);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Styles.colorLightBlue,
                      alignment: Alignment.center,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        color: Styles.colorBlack10,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

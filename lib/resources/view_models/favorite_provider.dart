import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mini_shop/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteProvider = ChangeNotifierProvider<FavoriteProvider>((ref) => FavoriteProvider());

class FavoriteProvider extends ChangeNotifier {
  final Set<int> _productIds = {};

  get favorites => _productIds;

  void toggleFavorite(BuildContext context, int productId) {
    if (_productIds.contains(productId)) {
      _productIds.remove(productId);
      Fluttertoast.showToast(
        msg: AppLocalizations.of(context)!.favoriteProductRemoved,
        toastLength: Toast.LENGTH_SHORT,
      );
    } else {
      _productIds.add(productId);
      Fluttertoast.showToast(
        msg: AppLocalizations.of(context)!.favoriteProductAdded,
        toastLength: Toast.LENGTH_SHORT,
      );
    }

    notifyListeners();
  }

  bool isFavorited(int productId) {
    return _productIds.contains(productId);
  }
}

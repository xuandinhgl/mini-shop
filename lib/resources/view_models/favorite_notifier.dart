import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mini_shop/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteNotifierProvider = NotifierProvider<FavoriteNotifier, Set<int>>(
  FavoriteNotifier.new,
);

class FavoriteNotifier extends Notifier<Set<int>> {
  void toggleFavorite(BuildContext context, int productId) {
    final updated = {...state};
    if (updated.contains(productId)) {
      updated.remove(productId);
      Fluttertoast.showToast(
        msg: AppLocalizations.of(context)!.favoriteProductRemoved,
        toastLength: Toast.LENGTH_SHORT,
      );
    } else {
      updated.add(productId);
      Fluttertoast.showToast(
        msg: AppLocalizations.of(context)!.favoriteProductAdded,
        toastLength: Toast.LENGTH_SHORT,
      );
    }

    state = updated;
  }

  bool isFavorited(int productId) => state.contains(productId);

  @override
  Set<int> build() => <int>{};
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Mini Shop';

  @override
  String get productRecommended => 'Recommended';

  @override
  String get favoriteProducts => 'Favorite products';

  @override
  String get noFavoriteProducts => 'No favorite products';

  @override
  String get shoppingCart => 'Shopping cart';

  @override
  String get shoppingCartEmpty => 'The shopping cart is empty';

  @override
  String get favoriteProductRemoved => 'Product removed from favorite';

  @override
  String get favoriteProductAdded => 'Product added to favorite';

  @override
  String get productAddedToCart => 'Added product to cart';

  @override
  String get productRemovedFromCart => 'Removed product from cart';

  @override
  String get addToCart => 'Add to cart';

  @override
  String get detail => 'Detail';
}

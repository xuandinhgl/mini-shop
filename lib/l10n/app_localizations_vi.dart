// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'Mini Shop';

  @override
  String get productRecommended => 'Gợi ý ';

  @override
  String get favoriteProducts => 'Sản phẩm yêu thích';

  @override
  String get noFavoriteProducts => 'Chưa có sản phẩm yêu thích';

  @override
  String get shoppingCart => 'Giỏ hàng';

  @override
  String get shoppingCartEmpty => 'Giỏ hàng đang trống';

  @override
  String get favoriteProductRemoved => 'Đã xoá sản phẩm khỏi mục yêu thích';

  @override
  String get favoriteProductAdded => 'Đã thêm sản phẩm vào mục yêu thích';

  @override
  String get productAddedToCart => 'Đã thêm sản phẩm vào giỏ hàng';

  @override
  String get productRemovedFromCart => 'Đã xoá sản phẩm vào giỏ hàng';

  @override
  String get addToCart => 'Thêm vào giỏ hàng';

  @override
  String get detail => 'Chi tiết';
}

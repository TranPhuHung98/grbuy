import 'package:bigdeals2/tabs/tabs.dart';

class AppStateCart {
  final List<ProductsItem> product;
AppStateCart(this.product);
 factory AppStateCart.initial() => AppStateCart(List.unmodifiable([]));
}
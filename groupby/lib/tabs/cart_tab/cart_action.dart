import 'package:bigdeals2/tabs/tabs.dart';

class AddItemAction {
  final ProductsItem item;

  AddItemAction(this.item);
}

class RemoveItemAction {
  final ProductsItem item;
  RemoveItemAction(this.item);
}
class RemoveAll{
}
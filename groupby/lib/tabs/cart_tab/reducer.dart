import 'package:redux/redux.dart';
import 'package:bigdeals2/tabs/tabs.dart';

AppStateCart appReducer(AppStateCart state, action) => AppStateCart(
    productListReducer(state.product, action),
    );

final Reducer<List<ProductsItem>> productListReducer = combineReducers([
  TypedReducer<List<ProductsItem>, AddItemAction>(_addItem),
  TypedReducer<List<ProductsItem>, RemoveItemAction>(_removeItem),
  TypedReducer<List<ProductsItem>,RemoveAll>(_removeAll),
]);

List<ProductsItem> _removeItem(
        List<ProductsItem> product, RemoveItemAction action) =>
    List.unmodifiable(List.from(product)..remove(action.item));

List<ProductsItem> _addItem(List<ProductsItem> product, AddItemAction action) =>
    List.unmodifiable(List.from(product)..add(action.item));
List<ProductsItem> _removeAll( List<ProductsItem> product,RemoveAll action) =>
    List.unmodifiable(List.from(product)..clear());

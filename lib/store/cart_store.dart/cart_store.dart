import 'package:mobile_ui/models/cart.dart';
import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {

  @observable
  int _total = 0;

  int get total => _total;

  set total(int total) {
    _total = total;
  }

  @observable
  ObservableList<Cart> _cart = ObservableList<Cart>();

  ObservableList<Cart> get cart => _cart;

  set cart(ObservableList<Cart> cart) {
    _cart = cart;
  }
}

/// We are using auto code generation to generate code for MobX store.
/// If we see any error with .g.dart file, try to run below command.
/// The 3rd command is recommended.
///
/// 1. Build (generate .g.dart):
///    flutter packages pub run build_runner build
/// 2. Build and Watch (update .g.dart automatically):
///    flutter packages pub run build_runner watch
/// 3. Clean before updating:
///    flutter packages pub run build_runner watch --delete-conflicting-outputs
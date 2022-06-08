// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartStore on _CartStore, Store {
  late final _$_totalAtom = Atom(name: '_CartStore._total', context: context);

  @override
  int get _total {
    _$_totalAtom.reportRead();
    return super._total;
  }

  @override
  set _total(int value) {
    _$_totalAtom.reportWrite(value, super._total, () {
      super._total = value;
    });
  }

  late final _$_cartAtom = Atom(name: '_CartStore._cart', context: context);

  @override
  ObservableList<Cart> get _cart {
    _$_cartAtom.reportRead();
    return super._cart;
  }

  @override
  set _cart(ObservableList<Cart> value) {
    _$_cartAtom.reportWrite(value, super._cart, () {
      super._cart = value;
    });
  }

  @override
  String toString() {
    return '''

    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bhaskara.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Bhaskara on _BhaskaraBase, Store {
  late final _$resultAtom =
      Atom(name: '_BhaskaraBase.result', context: context);

  @override
  String get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(String value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  late final _$joaoXVIIAtom =
      Atom(name: '_BhaskaraBase.joaoXVII', context: context);

  @override
  String get joaoXVII {
    _$joaoXVIIAtom.reportRead();
    return super.joaoXVII;
  }

  @override
  set joaoXVII(String value) {
    _$joaoXVIIAtom.reportWrite(value, super.joaoXVII, () {
      super.joaoXVII = value;
    });
  }

  late final _$_BhaskaraBaseActionController =
      ActionController(name: '_BhaskaraBase', context: context);

  @override
  dynamic squareRoot(dynamic a) {
    final _$actionInfo = _$_BhaskaraBaseActionController.startAction(
        name: '_BhaskaraBase.squareRoot');
    try {
      return super.squareRoot(a);
    } finally {
      _$_BhaskaraBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int deltaCalc(dynamic a, dynamic b, dynamic c) {
    final _$actionInfo = _$_BhaskaraBaseActionController.startAction(
        name: '_BhaskaraBase.deltaCalc');
    try {
      return super.deltaCalc(a, b, c);
    } finally {
      _$_BhaskaraBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic rootsCalc(dynamic a, dynamic b, dynamic c) {
    final _$actionInfo = _$_BhaskaraBaseActionController.startAction(
        name: '_BhaskaraBase.rootsCalc');
    try {
      return super.rootsCalc(a, b, c);
    } finally {
      _$_BhaskaraBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
result: ${result},
joaoXVII: ${joaoXVII}
    ''';
  }
}

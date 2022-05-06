import 'dart:math';


import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'bhaskara.g.dart';

class Bhaskara = _BhaskaraBase with _$Bhaskara;

abstract class _BhaskaraBase with Store {


  @observable
  String result = '';

  @observable
  String joaoXVII = '';

  @action
  squareRoot(a) {
    a = int.parse(a);
    final numberSquared = sqrt(a);
    return numberSquared;
  }

  @action
  int deltaCalc(a, b, c) {
    a = int.parse(a);
    b = int.parse(b);
    c = int.parse(c);
    final result = (b * b) - (4 * a * c);
    print(result);
    return result;
  }

  @action
  rootsCalc(a, b, c) {
    final fixa = int.parse(a);
    final fixb = int.parse(b);
    final fixc = int.parse(c);
    final delta = deltaCalc(a, b, c);
    print(delta);
    final x1 = (-fixb + delta) / (2 * fixa); //raiz 1
    final x2 = (-fixb - delta) / (2 * fixa); //raiz 2
    print('x1 = $x1, x2 = $x2');
    result = 'x1 = $x1 x2 = $x2';


    
    return result;
  }
}




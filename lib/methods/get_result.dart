import 'package:calculadora_bhaskara/methods/bhaskara.dart';
import 'package:flutter/material.dart';

import 'go_to_finished_page.dart';

void getResult(BuildContext ctx, a, b, c) {
  Bhaskara bhaskara = Bhaskara();
  final delta = bhaskara.deltaCalc(a, b, c);
  final x1Andx2 = bhaskara.rootsCalc(a, b, c);

  goToFinishedPage(ctx, a, b, c, delta, x1Andx2);
}
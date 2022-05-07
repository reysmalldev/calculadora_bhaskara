import 'package:flutter/material.dart';

import '../ui/widgets/calc_finished.dart';

void goToFinishedPage(BuildContext ctx, a, b, c, delta, roots) {
  Navigator.push(
    ctx,
    MaterialPageRoute(
      builder: (ctx) => Finished(
        valorA: a.toString(),
        valorB: b.toString(),
        valorC: c.toString(),
        delta: delta.toString(),
        roots: roots.toString(),
      ),
    ),
  );
}
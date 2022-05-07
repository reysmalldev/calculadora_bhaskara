import 'package:calculadora_bhaskara/methods/bhaskara.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Finished extends StatelessWidget {
  Finished(
      {Key? key,
      required this.valorA,
      required this.valorB,
      required this.valorC,
      required this.delta,
      required this.roots})
      : super(key: key);

  dynamic valorA;
  dynamic valorB;
  dynamic valorC;
  dynamic delta;
  dynamic roots;

  @override
  Widget build(BuildContext context) {
    Bhaskara bhaskara = Bhaskara();
    valorA = int.parse(valorA);
    valorB = int.parse(valorB);
    valorC = int.parse(valorC);
    const first = 'Δ = b² - 4.a.c';
    final aXc = valorA * valorC;
    final dXa = 2 * valorA;
    final bNeg = -valorB;
    final bWithA = valorA + valorB;
    final bWithoutA = bNeg - valorA;
    final bWithoutA_div = bWithoutA / dXa;
    final four_aXc = 4 * aXc;
    final bWithA_div = bWithA / dXa;
    final bAoquadrado = valorB * valorB;
    final raizDelta = bhaskara.squareRoot(delta);

    // List deltaText = [
    //   first,
    // ];
    // List x = [
    //   'x = -B ± √Δ ÷ 2.a',
    //   'x = -$valorB ± √$delta ÷ 2.$valorA',
    //   'x = -$valorB ± $raizDelta ÷ 2.$valorA',
    //   'x = -$valorB ± $raizDelta ÷ $dXa'
    // ];
    // List x1 = [
    //   'XI = -$valorB} + $valorA ÷ $dXa',
    //   'XI = $bWithA ÷ $dXa',
    //   'XI = $bWithA_div'
    // ];
    // List x2 = [
    //   'XII = -$valorB - $valorA ÷ $dXa',
    //   'XII = $bWithoutA ÷ $dXa',
    //   'XII = $bWithoutA_div'
    // ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                textWithseparator(first),
                textWithseparator(
                    'Δ = ${valorB.toString()}² - 4.${valorA.toString()}.${valorC.toString()}'),
                textWithseparator(
                    'Δ = ${valorB.toString()}² - 4.${aXc.toString()}'),
                textWithseparator(
                    'Δ = ${valorB.toString()}² - ${four_aXc.toString()}'),
                textWithseparator(
                    'Δ = ${bAoquadrado.toString()} - ${four_aXc.toString()}'),
                textWithseparator('Δ = ${delta.toString()}'),
                const SizedBox(
                  height: 50,
                ),
                textWithseparator('x = -B ± √Δ ÷ 2.a'),
                textWithseparator('x = -$bNeg ± √$delta ÷ 2.$valorA'),
                textWithseparator('x = -$bNeg ± $delta ÷ 2.$valorA'),
                textWithseparator('x = -$bNeg ± $raizDelta ÷ $dXa'),
                const SizedBox(
                  height: 50,
                ),
                textWithseparator('XI = -$valorB + $valorA ÷ $dXa'),
                textWithseparator('XI = $bWithA ÷ $dXa'),
                textWithseparator('XI = $bWithA_div'),
                const SizedBox(height: 50),
                textWithseparator('`XII = - $bNeg - $valorA ÷ $dXa '),
                textWithseparator('XII = $bWithoutA ÷ $dXa'),
                textWithseparator('XII = $bWithoutA_div'),

                // res.innerHTML += `XII = -${valorB} - ${valorA} ÷ ${DxA}<br>
                //     res.innerHTML += `XII = ${BmenosA} ÷ ${DxA}<br>`
                //     res.innerHTML += `XII = ${BmenosA_div}`
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget textWithseparator(String text) {
   final textStyle = GoogleFonts.oxygen(
      fontSize: 28,
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      wordSpacing: 2);
  return Padding(
    padding: const EdgeInsets.only(left: 10.0, right: 10),
    child: Column(
      children: [
        Text(
          text,
          style: textStyle,
        ),
        const SizedBox(
          width: 200,
          child: Divider(
            height: 10,
          ),
        ),
      ],
    ),
  );
}

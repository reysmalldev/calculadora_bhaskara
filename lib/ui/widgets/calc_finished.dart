import 'package:calculadora_bhaskara/methods/bhaskara.dart';
import 'package:calculadora_bhaskara/methods/go_to_finished_page.dart';
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
    final four_aXc = 4 * aXc;
    final bAoquadrado = valorB * valorB;
    final raizDelta = bhaskara.squareRoot(delta);
    final raizDeltaNeg = -raizDelta;
    final bWithoutRaizDelta = bNeg + raizDelta;
    final bWithoutRaizDeltaNeg = bNeg + raizDeltaNeg;
    final finalx1 = bWithoutRaizDelta / dXa;
    final finalx2 = bWithoutRaizDeltaNeg / dXa;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
       
      ),
      body: SafeArea(
        bottom: true,
        top: true,
        right: true,
        left: true,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  // Valor de delta
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
                  double.parse(delta) >= 0
                      ? Column(
                          children: [
                            textWithseparator('x = -B ± √Δ ÷ 2.a'),
                            textWithseparator(
                                'x = $bNeg ± √$delta ÷ 2.$valorA'),
                            textWithseparator(
                                'x = $bNeg ± $raizDelta ÷ 2.$valorA'),
                            textWithseparator('x = $bNeg ± $raizDelta ÷ $dXa'),
                            const SizedBox(
                              height: 50,
                            ),
                            // Valor de xa ou x1
                            textWithseparator('XI = $bNeg + $raizDelta ÷ $dXa'),
                            textWithseparator('XI = $bWithoutRaizDelta ÷ $dXa'),
                            textWithseparator('XI = $finalx1'),
                            const SizedBox(height: 50),
                            // Valor de xb ou x2
                            textWithseparator(
                                'XII = $bNeg $raizDeltaNeg ÷ $dXa '),
                            textWithseparator(
                                'XII = $bWithoutRaizDeltaNeg ÷ $dXa'),
                            textWithseparator('XII = $finalx2'),
                          ],
                        )
                      : textWithseparator(
                          'Delta($delta) é negativo, logo essa expressão é incompleta'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget textWithseparator(String text) {
  final textStyle = GoogleFonts.oxygen(
      fontSize: 20,
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
          width: 300,
          child: Divider(
            height: 10,
          ),
        ),
      ],
    ),
  );
}

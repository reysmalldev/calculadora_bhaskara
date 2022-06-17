import 'package:calculadora_bhaskara/ui/widgets/build_page.dart';
import 'package:flutter/material.dart';

class MayBody extends StatelessWidget {
  const MayBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
              children: [
                BuildPage(tag: 'Home',  noIscalcPage: true, context: context,),
                BuildPage(tag: 'Fórmula de Bhaskara!', context: context),
              ],
            );
  }
}
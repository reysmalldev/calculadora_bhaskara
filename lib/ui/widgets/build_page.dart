import 'package:calculadora_bhaskara/ui/widgets/calc_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildPage extends StatelessWidget {
  BuildPage({
    Key? key,
    required this.tag,
    this.noIscalcPage,
    required this.context
    }) : super(key: key);


  bool? noIscalcPage;
  final tag;
  BuildContext context;

  @override
  Widget build(context) {
    noIscalcPage ??= false;
    return Hero(
        tag: tag,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Observer(
              builder: (_) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      noIscalcPage!
                          ? calcPage(context)
                          : Container(
                              width: 350,
                              height: 400,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Color.fromARGB(255, 141, 157, 248)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  'By Reysmall dev and X_reverse',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.oxygen(
                                    fontSize: 28,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}

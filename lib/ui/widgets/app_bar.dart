import 'package:calculadora_bhaskara/methods/bhaskara.dart';
import 'package:calculadora_bhaskara/ui/widgets/calc_finished.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AppBarN extends StatelessWidget {
  const AppBarN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        bottom: true,
        top: true,
        right: true,
        left: true,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Color.fromARGB(255, 34, 32, 32),
            appBar: AppBar(
              title: const Text('Fórmulas de segundo grau'),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              // backgroundColor: Colors.cyanAccent,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.lightBlue, Colors.purpleAccent],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
              ),
              bottom: const TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 5,
                tabs: [
                  Tab(
                    icon: Icon(Icons.home),
                    text: 'Home',
                  ),
                  Tab(
                    icon: Icon(Icons.home),
                    text: 'Calculadora',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                buildPage(
                  'Home',
                  context,
                  noIscalcPage: true,
                ),
                buildPage('Fórmula de Bhaskara!', context),
              ],
            ),
          ),
        ),
      );
}

Widget buildPage(tag, BuildContext context, {bool noIscalcPage = false}) {
  return Hero(
    tag: tag,
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Observer(
          builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                noIscalcPage
                    ? calcPage(context)
                    : Container(
                        width: 350,
                        height: 400,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15),),
                            color: Colors.amberAccent[100]),
                        child: const Text(
                          'Home',
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    ),
  );
}

Widget calcPage(BuildContext ctx) {
  TextEditingController aText = TextEditingController();
  TextEditingController bText = TextEditingController();
  TextEditingController cText = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String xs = '';
  Bhaskara bhaskara = Bhaskara();

  void validate(GlobalKey<FormState> formkey) {
    if (formkey.currentState!.validate()) {
      bhaskara.joaoXVII = 'Pass';
      getResult(ctx, aText.text, bText.text, cText.text);
    } else {
      bhaskara.joaoXVII = 'Digite somente números';
    }
  }

  String? validar(String? value) {
    if (value == null || value.isEmpty) {
      bhaskara.joaoXVII = 'Preencha os campos corretamente...';
      return '';
    } else if (int.parse(value) < 1) {
      bhaskara.joaoXVII = 'Preencha os campos com números...';
      return '';
    } else {
      return null;
    }
  }

  Widget buildFields(val) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            width: 100,
            child: TextFormField(
              style: const TextStyle(color: Colors.white, fontSize: 20),
              controller: aText,
              validator: validar,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'a',
                hintStyle: TextStyle(color: Colors.white),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.limeAccent,
                  ),
                ),
              ),
              onChanged: (text) {
                print(text);
              },
            ),
          ),
          SizedBox(
            width: 100,
            child: TextFormField(
              style: const TextStyle(color: Colors.white, fontSize: 20),
              controller: bText,
              keyboardType: TextInputType.number,
              validator: validar,
              keyboardAppearance: Brightness.dark,
              decoration: const InputDecoration(
                hintText: 'b',
                hintStyle: TextStyle(color: Colors.white),
              ),
              onChanged: (text) {
                print(text);
              },
            ),
          ),
          SizedBox(
            width: 100,
            child: TextFormField(
              controller: cText,
              validator: validar,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'c',
                hintStyle: TextStyle(color: Colors.white),
              ),
              onChanged: (text) {
                print(text);
              },
            ),
          ),
        ],
      ),
    );
  }

  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: Container(
      width: 400,
      height: 500,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          color: Color.fromARGB(255, 141, 157, 248)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Digite o valor das incógnitas:',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(key: formkey, child: buildFields('a')),
                const SizedBox(
                  width: 50,
                ),
                TextButton(
                  onPressed: () {
                    validate(formkey);
                  },
                  child: const Text('Calcular'),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            // Observer(
            //   builder: (ctx) {
            //     return Column(
            //       children: [
            //         Text(
            //           bhaskara.result,
            //           style: const TextStyle(color: Colors.white, fontSize: 28),
            //         ),
            //         Text(
            //           bhaskara.joaoXVII,
            //           style: const TextStyle(color: Colors.white, fontSize: 28),
            //         )
            //       ],
            //     );
            //   },
            // ),
          ],
        ),
      ),
    ),
  );
}

void getResult(BuildContext ctx, a, b, c) {
  Bhaskara bhaskara = Bhaskara();
  final delta = bhaskara.deltaCalc(a, b, c);
  final x1Andx2 = bhaskara.rootsCalc(a, b, c);

  goToFinishedPage(ctx, a, b, c, delta, x1Andx2);
}

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

import 'package:calculadora_bhaskara/methods/get_result.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:calculadora_bhaskara/methods/bhaskara.dart';

class CalcPage extends StatelessWidget {
  const CalcPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return calcPage(context);
  }
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

  bool isInteger(num value) => value is int || value == value.roundToDouble();

  String? validar(String? value) {
    if (value == null || value.isEmpty) {
      bhaskara.joaoXVII = 'Preencha os campos corretamente...';
      return 'Preencha :|';
    } else if(value.runtimeType is int){
      validate(formkey);
      return null;
    } else{

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
              style: GoogleFonts.oxygen(fontSize: 20, color: Colors.white),
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
            Text(
              'Digite o valor das incógnitas:',
              style: GoogleFonts.oxygen(fontSize: 30, color: Colors.white),
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
                  child: Text(
                    'Calcular',
                    style:
                        GoogleFonts.oxygen(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    ),
  );
}

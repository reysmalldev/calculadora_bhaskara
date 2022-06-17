import 'package:calculadora_bhaskara/ui/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            backgroundColor: const Color.fromARGB(255, 34, 32, 32),
            appBar: AppBar(
              title: Text(
                'Fórmulas de segundo grau',
                style: GoogleFonts.oxygen(
                  fontSize: 20,
                ),
              ),
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
                    text: 'Calculadora',
                  ),
                  Tab(
                    icon: Icon(Icons.home),
                    text: 'Credits',
                  ),
                ],
              ),
            ),
            body: const MayBody(),
          ),
        ),
      );
}
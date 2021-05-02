import 'package:flutter/material.dart';
import 'package:quizzler_app/quiizzler.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black38,
          appBar: AppBar(
            title: Center(
                child: Text(
              "Quizzler ",
              style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold),
            )),
            backgroundColor: Colors.white,
          ),
          body: Stack(
            children: [
              Transform.translate(
                offset: Offset(0, 0),
                child: Container(
                  width: double.infinity,
                  height: 450,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: ExactAssetImage('assets/CAT3.png'),
                  )),
                ),
              ),
              Quizzler(),
            ],
          ),
        ));
  }
}

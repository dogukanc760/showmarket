import 'dart:async';

import 'package:flutter/material.dart';
import 'package:showmarket/screens/anasayfa.dart';

class Karsilama extends StatefulWidget {
  const Karsilama({Key? key}) : super(key: key);

  @override
  _KarsilamaState createState() => _KarsilamaState();
}

class _KarsilamaState extends State<Karsilama> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Anasayfa())));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: Image(
                  image: AssetImage('assets/succed_signed.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

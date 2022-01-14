import 'dart:async';

import 'package:flutter/material.dart';
import 'package:showmarket/screens_service_provider/anasayfa_hv.dart';

class KarsilamaHizmet extends StatefulWidget {
  const KarsilamaHizmet({Key? key}) : super(key: key);

  @override
  _KarsilamaHizmetState createState() => _KarsilamaHizmetState();
}

class _KarsilamaHizmetState extends State<KarsilamaHizmet> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => AnasayfaHizmet())));
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

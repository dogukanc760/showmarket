import 'package:flutter/material.dart';
import 'package:showmarket/screens_service_provider/anasayfa_hv.dart';

class TalepBasarili extends StatelessWidget {
  const TalepBasarili({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFEB3A18),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          top: true,
          bottom: true,
          left: true,
          right: true,
          child: SingleChildScrollView(
              child: Stack(
            children: [IslemBasarili()],
          )),
        ),
      ),
    );
  }
}

class IslemBasarili extends StatelessWidget {
  const IslemBasarili({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: double.infinity,
                height: 380,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage('assets/1.Ekran-2.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Image(
                  image: AssetImage('assets/logo.png'),
                  height: 350,
                  width: 350,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  '                   Tebrikler \n Teklifiniz Başarıyla Gönderildi!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: SizedBox(
                height: 50,
                width: 200,
                child: RaisedButton(
                  textColor: Colors.black,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        color: Color(0xFFEB3A18),
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AnasayfaHizmet()),
                    );
                  },
                  child: const Text(
                    'Diğer teklif bekleyen işleri gör',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 29.0),
              child: Container(
                child: Image(
                    image: AssetImage('assets/altbar.png'), fit: BoxFit.fill),
              ),
            )
          ],
        ),
      ),
    );
  }
}

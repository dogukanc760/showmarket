import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1.dart';
import 'package:showmarket/screens_service_provider/anasayfa_hv.dart';

class TeklifSun extends StatefulWidget {
  const TeklifSun({Key? key}) : super(key: key);

  @override
  _talepTamamlandiState createState() => _talepTamamlandiState();
}

class _talepTamamlandiState extends State<TeklifSun> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(child: tamamlandiYorum()),
        ),
        bottomNavigationBar: NavigationBottom(),
      ),
    );
  }
}

class tamamlandiYorum extends StatefulWidget {
  const tamamlandiYorum({Key? key}) : super(key: key);

  @override
  _tamamlandiYorumState createState() => _tamamlandiYorumState();
}

class _tamamlandiYorumState extends State<tamamlandiYorum> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 106, right: 105),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 5, color: Colors.black, offset: Offset(1, 3))
              ],
              image: DecorationImage(
                  image: AssetImage('assets/sinemaArkaplan.jpg'),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(120),
            ),
            width: 200,
            height: 200,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Text(
              'İşletme Adı',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Salon Adı',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600),
            ),
            TextButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "14 Yorum ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFEB3A18),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: RatingBar.builder(
                  initialRating: 3.5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 17,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    size: 2,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Müşterilerimizin memnunuyeti için en iyi teklifi verin.',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 50,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.brown, width: 2),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: TextField(
              cursorColor: Colors.brown,
              maxLines: 8,
              decoration: InputDecoration(
                hintText: 'Teklifinizi yazın.',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 50,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.brown, width: 2),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: TextField(
              maxLines: 8,
              decoration: InputDecoration(
                hintText: 'Verilen teklifin detaylı açıklamasını yapın.',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 150,
          height: 40,
          child: RaisedButton(
            textColor: Colors.black,
            color: Color(0xFFEB3A18),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                  color: Color(0xFFEB3A18), width: 5, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(15),
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AnasayfaHizmet()));
            },
            child: const Text(
              'Gönder',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}

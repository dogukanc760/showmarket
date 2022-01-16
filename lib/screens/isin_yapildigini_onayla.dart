import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1.dart';
import 'package:showmarket/screens/anasayfa.dart';

class IsinYapildiginiOnayla extends StatelessWidget {
  final String companyName;
  final String title;
  const IsinYapildiginiOnayla({required this.companyName, required this.title}) : super();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          top: true,
          bottom: true,
          left: true,
          right: true,
          child: SingleChildScrollView(
            child: Stack(
              children: [OnaylamaKismi(title: this.title, companyName: this.companyName,)],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBottom(),
      ),
    );
  }
}

class OnaylamaKismi extends StatefulWidget {
  final String companyName;
  final String title;
  const OnaylamaKismi({required this.companyName, required this.title}) : super();

  @override
  _OnaylamaKismiState createState() => _OnaylamaKismiState();
}

class _OnaylamaKismiState extends State<OnaylamaKismi> {
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
              widget.companyName,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.title,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        '5.0',
                        style: TextStyle(
                            color: Color(0xFFEB3A18),
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25.0),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25.0),
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
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.black,
          thickness: 2,
          height: 3,
          indent: 50,
          endIndent: 50,
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 280.0),
          child: Text(
            'Yorum Yap',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        SizedBox(
          height: 25,
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
              cursorColor: Colors.brown,
              maxLines: 8,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Yorum yap!',
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
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Anasayfa()));
            },
            child: const Text(
              'Tamamla',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}

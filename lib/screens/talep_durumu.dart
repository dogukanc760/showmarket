import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1.dart';
import 'package:showmarket/screens/hizmet_alan_teklif_kabul.dart';
import 'package:showmarket/screens/is_neden_iptal_edildi.dart';
import 'package:showmarket/screens/isin_yapildigini_onayla.dart';

import 'HizmetVereninProfiliBuradaKullanılcakOlan!/hizmet_verenin_profili.dart';

class TalepDurumu extends StatelessWidget {
  final int state;
  TalepDurumu({required this.state}) : super();

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
              children: [TalepIcerik(state: this.state, context: context,)],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBottom(),
      ),
    );
  }
}

int states = 0;

class TalepIcerik extends StatefulWidget {
  final int state;
  BuildContext context;
  TalepIcerik({required this.state, required this.context}) : super();

  @override
  _TalepIcerikState createState() => _TalepIcerikState();
}

class _TalepIcerikState extends State<TalepIcerik> {
  @override
  var teklifVerildi = Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 0),
            child: TextButton(
              child: Text(
                'İşletme Adı',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              onPressed: () {


              },
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(right: 270.0, top: 5),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 37.0),
              child: Text(
                'Salon Adı',
                style: TextStyle(fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 190.0, top: 5),
              child: Text(
                'Teklif İstendi',
                style: TextStyle(
                  color: Color(0xFFEB3A18),
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
  var teklifBekliyor = Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              'Kullanıcı Adı',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(right: 270.0, bottom: 5),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 37.0),
              child: Text(
                'Salon Adı',
                style: TextStyle(fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 190.0),
              child: Text(
                'Teklif Geldi',
                style: TextStyle(
                  color: Color(0xFFEB3A18),
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
  var organizasyonTamam = Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              'Kullanıcı Adı',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(right: 270.0, bottom: 5),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 37.0),
              child: Text(
                'Salon Adı',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      )
    ],
  );
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
            child: Column(
              children: [
                widget.state == 1
                    ? teklifVerildi
                    : widget.state == 2
                        ? organizasyonTamam
                        : widget.state == 4
                            ? teklifBekliyor
                            : teklifBekliyor,
                Column(
                  children: [
                    Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Container(
                                  width: 350,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/sinemaArkaplan.jpg"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              )
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
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30.0),
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
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 25.0),
                                        child: RatingBar.builder(
                                          initialRating: 3.5,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 17,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 2.0),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
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
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            indent: 25,
            endIndent: 25,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
            child: Row(
              children: [
                Container(
                  height: 25,
                  width: 25,
                  child: Image(
                    image: AssetImage('assets/konum.png'),
                  ),
                ),
                Text(
                  'Kadıköy/İstanbul',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Icon(
                    Icons.alarm,
                    size: 19,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '13:00',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Icon(
                    Icons.date_range,
                    size: 19,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '01.01.2022',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Divider(
            thickness: 2,
            indent: 25,
            endIndent: 25,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Text('Film Kategorisi',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                    child: Text('Aksiyon',
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                            fontSize: 10)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Text('Vizyondaki film',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                    child: Text('Cehennem Melekleri',
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                            fontSize: 10)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Text('Kaç kişi olacak?',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                    child: Text('3 Kişi',
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                            fontSize: 10)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: SizedBox(
              width: 270,
              child: Row(
                children: [
                  widget.state == 1
                      ? Container(
                          width: 270,
                          height: 37,
                          child: RaisedButton(
                            textColor: Colors.black,
                            color: Color(0xFFEB3A18),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Color(0xFFEB3A18),
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IsIptalEdildi()));
                            },
                            child: const Text('İptal Et'),
                          ),
                        )
                      : widget.state == 2
                          ? Column(
                              children: [
                                RaisedButton(
                                  textColor: Colors.black,
                                  color: Color(0xFFEB3A18),
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Color(0xFFEB3A18),
                                        width: 5,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                IsinYapildiginiOnayla()));
                                  },
                                  child: const Text(
                                    'Organizasyonun yapıldığını onayla',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                RaisedButton(
                                  textColor: Colors.black,
                                  color: Colors.amberAccent,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Colors.amberAccent,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                IsIptalEdildi()));
                                  },
                                  child: const Text('İptal Et'),
                                ),
                              ],
                            )
                          : widget.state == 2
                              ? Column(
                                  children: [
                                    FlatButton(
                                      minWidth: 250,
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    IsinYapildiginiOnayla()));
                                      },
                                      child: Text('İşin Yapıldığını Onayla',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      color: Colors.deepPurple,
                                    ),
                                    RaisedButton(
                                      textColor: Colors.black,
                                      color: Colors.amberAccent,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.amberAccent,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      onPressed: () {},
                                      child: const Text('İptal Et'),
                                    ),
                                  ],
                                )
                              : widget.state == 4
                                  ? Row(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 35,
                                          child: RaisedButton(
                                            textColor: Colors.black,
                                            color: Colors.amberAccent,
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: Colors.amberAccent,
                                                  style: BorderStyle.solid),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            onPressed: () {},
                                            child: const Text('İptal Et'),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              90, 0, 0, 0),
                                          child: Container(
                                            width: 100,
                                            height: 35,
                                            child: RaisedButton(
                                              textColor: Colors.black,
                                              color: Color(0xFFEB3A18),
                                              shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    color: Color(0xFFEB3A18),
                                                    width: 5,
                                                    style: BorderStyle.solid),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            TalepKabul()));
                                              },
                                              child: const Text('Kabul Et'),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : SizedBox(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

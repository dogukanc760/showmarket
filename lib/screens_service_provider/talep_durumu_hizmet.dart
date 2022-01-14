import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1_Hizmet.dart';
import 'package:showmarket/screens_service_provider/Hizmet_fotograf.dart';
import 'package:showmarket/screens_service_provider/anasayfa_hv.dart';
import 'package:showmarket/screens_service_provider/talep_tamamlandi_hizmet.dart';

class TalepDurumuTeklifVer extends StatelessWidget {
  final int state;
  const TalepDurumuTeklifVer({required this.state}) : super();

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
              children: [TalepIcerikHizmet(state: this.state)],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBottomHizmet(),
      ),
    );
  }
}

int states = 0;

class TalepIcerikHizmet extends StatefulWidget {
  final int state;

  const TalepIcerikHizmet({required this.state}) : super();

  @override
  _TalepIcerikHizmetState createState() => _TalepIcerikHizmetState();
}

class _TalepIcerikHizmetState extends State<TalepIcerikHizmet> {
  @override
  var teklifVerildi = Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 15),
            child: Text(
              'Kullanıcı Adı',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 200.0, top: 15),
            child: Text(
              '500 ₺',
              style: TextStyle(
                  color: Color(0xFFEB3A18), fontWeight: FontWeight.bold),
            ),
          )
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
                'Teklif Verildi',
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
                'Teklif Bekliyor',
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
          widget.state == 1
              ? teklifVerildi
              : widget.state == 2
                  ? organizasyonTamam
                  : widget.state == 4
                      ? teklifBekliyor
                      : teklifBekliyor,
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Column(
              children: [
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
                    child: Text(
                      '3 Kişi',
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
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
                                  builder: (context) => AnasayfaHizmet(),
                                ),
                              );
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
                                        builder: (context) => HizmetFotograf(),
                                      ),
                                    );
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
                                  onPressed: () {},
                                  child: const Text('İptal Et'),
                                ),
                              ],
                            )
                          : widget.state == 3
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
                                                HizmetFotograf(),
                                          ),
                                        );
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
                                                            TeklifSun()));
                                              },
                                              child: const Text('Teklif Ver'),
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

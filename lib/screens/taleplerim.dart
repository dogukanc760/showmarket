import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1.dart';
import 'package:showmarket/screens/HizmetVereninProfiliBuradaKullan%C4%B1lcakOlan!/hizmet_verenin_profili.dart';
import 'package:showmarket/screens/talep_durumu.dart';

class Taleplerim extends StatelessWidget {
  const Taleplerim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Taleplerim',
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 25,
            ),
          ),
          elevation: 0,
          toolbarHeight: 45,
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorColor: Color(0xFFEB3A18),
            labelColor: Color(0xFFEB3A18),
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Text(
                'Açık Taleplerim',
                style: TextStyle(color: Colors.grey.shade800),
              ),
              Text(
                'Sonlanan Taleplerim',
                style: TextStyle(color: Colors.grey.shade800),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[TalepDurumlarim(), TalepBitenlerim()],
        ),
        bottomNavigationBar: NavigationBottom(),
      ),
    );
  }
}

class TalepDurumlarim extends StatefulWidget {
  const TalepDurumlarim({Key? key}) : super(key: key);

  @override
  _TalepDurumlarimState createState() => _TalepDurumlarimState();
}

class _TalepDurumlarimState extends State<TalepDurumlarim> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.bottom -
                170,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90.0),
                        side: BorderSide(width: 1, color: Colors.grey),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Image(
                            image: AssetImage('assets/kategori_1.png'),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 30, 0),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => hvProfil(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'İşletme Adı',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 10),
                                    child: Text(
                                      'Yataklı Sinema',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 60.0, bottom: 10),
                                    child: SizedBox(
                                      width: 150,
                                      height: 35,
                                      child: index == 1
                                          ? TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        TalepDurumu(state: 4),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                child: Text(
                                                  '500 ₺',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xFFEB3A18),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : index % 2 == 0
                                              ? TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            TalepDurumu(
                                                                state: 1),
                                                      ),
                                                    );
                                                  },
                                                  child: Text(
                                                    'Teklif Bekliyor',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xFFEB3A18),
                                                    ),
                                                  ),
                                                )
                                              : TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            TalepDurumu(
                                                                state: 2),
                                                      ),
                                                    );
                                                  },
                                                  child: Text(
                                                    '500 ₺',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xFFEB3A18),
                                                    ),
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
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class TalepBitenlerim extends StatefulWidget {
  const TalepBitenlerim({Key? key}) : super(key: key);

  @override
  _TalepBitenlerimState createState() => _TalepBitenlerimState();
}

class _TalepBitenlerimState extends State<TalepBitenlerim> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.bottom -
                170,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90.0),
                        side: BorderSide(width: 1, color: Colors.grey),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Image(
                            image: AssetImage('assets/kategori_1.png'),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 15, 0, 0),
                                child: Text(
                                  'İşletme Adı',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 0, 10),
                                    child: Text(
                                      'Yataklı Sinema',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 220,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 110.0, bottom: 10),
                                      child: FlatButton(
                                        onPressed: () {},
                                        child: Column(
                                          children: [
                                            Text(
                                              'İptal Edildi',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xFFEB3A18),
                                              ),
                                            )
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1_Hizmet.dart';
import 'package:showmarket/screens_service_provider/talep_durumu_hizmet.dart';

class TaleplerimHizmet extends StatelessWidget {
  const TaleplerimHizmet({Key? key}) : super(key: key);

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
          children: <Widget>[TalepDurumlarimHizmet(), TalepBitenlerimHizmet()],
        ),
        bottomNavigationBar: NavigationBottomHizmet(),
      ),
    );
  }
}

class TalepDurumlarimHizmet extends StatefulWidget {
  const TalepDurumlarimHizmet({Key? key}) : super(key: key);

  @override
  _TalepDurumlarimHizmetState createState() => _TalepDurumlarimHizmetState();
}

class _TalepDurumlarimHizmetState extends State<TalepDurumlarimHizmet> {
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
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 12),
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            image: DecorationImage(
                                image: AssetImage(
                                  ('assets/profilFoto.png'),
                                ),
                                fit: BoxFit.fill),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 15, 0, 0),
                                  child: Text(
                                    'Kullanıcı Adı',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 0, 0, 10),
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
                                                          TalepDurumuTeklifVer(
                                                              state: 1),
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
                                                              TalepDurumuTeklifVer(
                                                                  state: 4),
                                                        ),
                                                      );
                                                    },
                                                    child: Text(
                                                      'Teklif Bekliyor',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color:
                                                            Color(0xFFEB3A18),
                                                      ),
                                                    ),
                                                  )
                                                : TextButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              TalepDurumuTeklifVer(
                                                                  state: 2),
                                                        ),
                                                      );
                                                    },
                                                    child: Text(
                                                      '500 ₺',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color:
                                                            Color(0xFFEB3A18),
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
        ),
      ),
    );
  }
}

class TalepBitenlerimHizmet extends StatefulWidget {
  const TalepBitenlerimHizmet({Key? key}) : super(key: key);

  @override
  _TalepBitenlerimHizmetState createState() => _TalepBitenlerimHizmetState();
}

class _TalepBitenlerimHizmetState extends State<TalepBitenlerimHizmet> {
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
              itemCount: 15,
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
                        padding: const EdgeInsets.fromLTRB(7, 7, 7, 7),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            image: DecorationImage(
                                image: AssetImage(
                                  ('assets/kategori_2.png'),
                                ),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Text(
                                    'İşletme Adı',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text(
                                    'Yataklı Sinema',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 100.0),
                                  child: SizedBox(
                                    width: 120,
                                    child: FlatButton(
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Text(
                                            'İptal Edildi',
                                            style: TextStyle(
                                                color: Color(0xFFEB3A18),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
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
    //DEĞİŞECEK YERLER VAR
  }
}

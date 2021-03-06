import 'package:flutter/material.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1_Hizmet.dart';
import 'package:showmarket/screens_service_provider/hizmetkarsilama_Hizmet.dart';

final List<String> categoryList = [
  '',
  'Sinema',
  'Tiyatro',
  'Doğum Günü',
  'Dans',
  'Müzik',
  'Sportif',
  'LunaPark',
  'Sirk',
  'Geziler',
  'Açık Alan',
  'Kapalı Alan',
];

class KategorilerHizmet extends StatefulWidget {
  const KategorilerHizmet({Key? key}) : super(key: key);

  @override
  _KategorilerState createState() => _KategorilerState();
}

class _KategorilerState extends State<KategorilerHizmet> {
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
              children: [KategoriListe()],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBottomHizmet(),
      ),
    );
  }
}

class KategoriListe extends StatefulWidget {
  const KategoriListe({Key? key}) : super(key: key);

  @override
  _KategoriListeState createState() => _KategoriListeState();
}

class _KategoriListeState extends State<KategoriListe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
                child: TextFormField(
                  // The validator receives the text that the user has entered.
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.white, width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 0.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.white, width: 0.0),
                      ),
                      contentPadding: new EdgeInsets.symmetric(vertical: 0),
                      hintText: 'Kategoriler',
                      hintStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      filled: true,
                      suffixIcon: IconButton(
                        padding: const EdgeInsetsDirectional.only(start: 12.0),
                        alignment: Alignment.centerLeft,
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                        ),
                      )),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Boş Bir Sorgu Aranamaz!';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 3,
            indent: 25,
            endIndent: 55,
          ),
          Column(
            children: [
              Row(children: [
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: 475,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: 11,
                            itemBuilder: (BuildContext context, int index) =>
                                Row(
                              children: [
                                Card(
                                  elevation: 0,
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: [
                                          Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(90.0),
                                                side: BorderSide(
                                                    width: 1,
                                                    color: Colors.grey)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                'assets/kategori_${index + 1}.png',
                                                height: 35,
                                                width: 35,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 0, 0, 0),
                                            child: Text(
                                              '${categoryList[index + 1]}',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                          IconButton(
                                            splashColor: Colors.red,
                                            splashRadius: 150,
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      HizmetVeren(),
                                                ),
                                              );
                                            },
                                            icon: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}

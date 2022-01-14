import 'package:flutter/material.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1_Hizmet.dart';
import 'package:url_launcher/url_launcher.dart';

class HizmetAlanProfil extends StatelessWidget {
  const HizmetAlanProfil({Key? key}) : super(key: key);

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
              children: [ProfilIcerik()],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBottomHizmet(),
      ),
    );
  }
}

class ProfilIcerik extends StatefulWidget {
  const ProfilIcerik({Key? key}) : super(key: key);

  @override
  _ProfilIcerikState createState() => _ProfilIcerikState();
}

class _ProfilIcerikState extends State<ProfilIcerik> {
  _makingPhoneCall() async {
    const url = '';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              'Kullanıcı Profili',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEB3A18),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 258.0),
                child: Text(
                  'Kullanıcı Adı',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 270.0, top: 5, bottom: 5),
                child: Text(
                  'Hizmet isteği',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
          Column(
            children: [
              Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 120.0, bottom: 20),
                          child: Container(
                            width: 180,
                            height: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                image: AssetImage("assets/profilFoto.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 15, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                      child: Text('Kullanıcının Yorumları',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 287.0),
                              child: Text(
                                'Kullanıcı Adı',
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                                'Lorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor set',
                                style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text('Hakkında',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Text(
                          'Lorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor setLorem ipsum dolor set',
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 220,
                        child: RaisedButton(
                          textColor: Colors.black,
                          color: Color(0xFFEB3A18),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Color(0xFFEB3A18),
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'İletişime Geç',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

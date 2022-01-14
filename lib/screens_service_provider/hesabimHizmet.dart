import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1_Hizmet.dart';
import 'package:showmarket/screens_service_provider/Profilim/guvenlikhizmet.dart';
import 'package:showmarket/screens_service_provider/Profilim/profilim_hizmet.dart';

import 'Profilim/adreslerimHizmet.dart';

class HesabimHizmet extends StatelessWidget {
  const HesabimHizmet({Key? key}) : super(key: key);

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
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                width: double.infinity,
                                height: 210,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    alignment: Alignment.centerRight,
                                    image:
                                        AssetImage('assets/yukariEklenti.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Image(
                                  image: AssetImage('assets/logo.png'),
                                  height: 210,
                                  width: 250,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                child: Center(
                                  child: Stack(children: [
                                    Text(
                                      'Ahmet Hizmet Veren',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                                ),
                                height: 20.0,
                                width:
                                    MediaQuery.of(context).size.width - 100.0,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(40, 20, 0, 0),
                          child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Image(
                                  image: AssetImage('assets/customer.png')))),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilHizmet()),
                            );
                          },
                          child: Text(
                            'Profilim',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: Image(
                            color: Colors.black,
                            image: AssetImage('assets/kilit.png'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GuvenlikHizmet()),
                              );
                            },
                            child: Text('Güvenlik',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18))),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: Image(
                            color: Colors.black,
                            image: AssetImage('assets/konum.png'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdreslerimHizmet()),
                              );
                            },
                            child: Text('Adreslerim',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18))),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                          child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Image(
                                  image: AssetImage('assets/paylas.png')))),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: TextButton(
                            onPressed: () {
                              print('arkadaş davet edildi!');
                            },
                            child: Text('Arkadaşına tavsiye et',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18))),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                          child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Image(
                                  image: AssetImage('assets/cikis.png')))),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: TextButton(
                            onPressed: () {},
                            child: Text('Çıkış Yap',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18))),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBottomHizmet(),
      ),
    );
  }
}

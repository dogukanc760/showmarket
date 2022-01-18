import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1.dart';
import 'package:showmarket/main.dart';
import 'package:showmarket/screens/guvenlik.dart';
import 'package:showmarket/screens/profilim.dart';

import 'adreslerim.dart';

class Hesabim extends StatefulWidget {
  const Hesabim({Key? key}) : super(key: key);

  @override
  State<Hesabim> createState() => _HesabimState();
}
String name='';
String userId = '';
void destroySession(BuildContext context)async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MyApp()),
  );
}

class _HesabimState extends State<Hesabim> {

  final passwordController = TextEditingController();
  final passwordFinalController = TextEditingController();
  void getSession() async {

    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username').toString();
      name = prefs.getString('name').toString();
      surname = prefs.getString('surname').toString();
      gsm = prefs.getString('gsm').toString();
      userId = prefs.getString('id').toString();
    });

    print(userId+username+name);

  }
  @override
  void initState() {
    getSession();
    super.initState();
  }

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
                                      name,
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
                              MaterialPageRoute(builder: (context) => Profil()),
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
                                    builder: (context) => Guvenlik()),
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
                                    builder: (context) => Adreslerim()),
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
                            onPressed: () {
                              destroySession(context);
                            },
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
        bottomNavigationBar: NavigationBottom(),
      ),
    );
  }
}

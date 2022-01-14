import 'package:flutter/material.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1.dart';

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

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
            children: [Profilim()],
          )),
        ),
        bottomNavigationBar: NavigationBottom(),
      ),
    );
  }
}

class Profilim extends StatefulWidget {
  const Profilim({Key? key}) : super(key: key);

  @override
  _ProfilimState createState() => _ProfilimState();
}

class _ProfilimState extends State<Profilim> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                              image: AssetImage('assets/yukariEklenti.png'),
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
                                'Ahmet Müşteri',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ),
                          height: 20.0,
                          width: MediaQuery.of(context).size.width - 100.0,
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
                    padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Container(
                        width: 25,
                        height: 25,
                        child:
                            Image(image: AssetImage('assets/customer.png')))),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profil()),
                        );
                      },
                      child: Text('Profilim',
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.bold,
                              fontSize: 16))),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
            child: TextFormField(
              enableSuggestions: false,
              autocorrect: false,
              // The validator receives the text that the user has entered.
              decoration: InputDecoration(
                  focusColor: Color(0xFFEB3A18),
                  hintText: 'Adınız ve Soyadınız',
                  hintStyle:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ad-Soyad Boş Geçilemez!';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
            child: TextFormField(
              enableSuggestions: false,
              autocorrect: false,
              // The validator receives the text that the user has entered.
              decoration: InputDecoration(
                  focusColor: Color(0xFFEB3A18),
                  hintText: 'Mail adresiniz',
                  hintStyle:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Mail Boş Geçilemez!';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
            child: TextFormField(
              enableSuggestions: false,
              autocorrect: false,
              // The validator receives the text that the user has entered.
              decoration: InputDecoration(
                focusColor: Color(0xFFEB3A18),
                hintText: 'Gsm Numaranız +90',
                hintStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Gsm Boş Geçilemez!';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: SizedBox(
              width: 180,
              child: RaisedButton(
                textColor: Colors.black,
                color: Color(0xFFEB3A18),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      color: Color(0xFFEB3A18),
                      width: 5,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(45),
                ),
                onPressed: () {},
                child: const Text('Güncelle'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

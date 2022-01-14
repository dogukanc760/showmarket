import 'package:flutter/material.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1_Hizmet.dart';

class GuvenlikHizmet extends StatelessWidget {
  const GuvenlikHizmet({Key? key}) : super(key: key);

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
              children: [GuvenlikGuncelle()],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBottomHizmet(),
      ),
    );
  }
}

class GuvenlikGuncelle extends StatefulWidget {
  const GuvenlikGuncelle({Key? key}) : super(key: key);

  @override
  _GuvenlikGuncelleState createState() => _GuvenlikGuncelleState();
}

class _GuvenlikGuncelleState extends State<GuvenlikGuncelle> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = true;
  bool _offer = false;
  bool _offer1 = false;
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
                                  'Ahmet Hizmet Veren',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GuvenlikHizmet()),
                          );
                        },
                        child: Text('Güvenlik',
                            style:
                                TextStyle(color: Colors.black, fontSize: 17))),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
              child: TextFormField(
                enableSuggestions: false,
                autocorrect: false,
                // The validator receives the text that the user has entered.
                decoration: InputDecoration(
                    focusColor: Colors.deepPurple,
                    hintText: 'Mevcut Parolanız',
                    hintStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Eski Parola Boş Geçilemez!';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
              child: TextFormField(
                obscureText: _passwordVisible,
                enableSuggestions: false,
                autocorrect: false,
                // The validator receives the text that the user has entered.
                decoration: InputDecoration(
                    focusColor: Colors.deepPurple,
                    hintText: 'Yeni parolanız',
                    hintStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Parola Boş Geçilemez!';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 15),
              child: TextFormField(
                obscureText: _passwordVisible,
                enableSuggestions: false,
                autocorrect: false,
                // The validator receives the text that the user has entered.
                decoration: InputDecoration(
                    focusColor: Colors.deepPurple,
                    hintText: 'Parolanızı tekrar girin',
                    hintStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Parola Boş Geçilemez!';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
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
        ));
  }
}

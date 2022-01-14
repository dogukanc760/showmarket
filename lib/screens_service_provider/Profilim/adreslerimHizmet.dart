import 'package:flutter/material.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1_Hizmet.dart';

class AdreslerimHizmet extends StatelessWidget {
  const AdreslerimHizmet({Key? key}) : super(key: key);

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
              children: [AdresIcerik()],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBottomHizmet(),
      ),
    );
  }
}

class AdresIcerik extends StatefulWidget {
  const AdresIcerik({Key? key}) : super(key: key);

  @override
  _AdresIcerikState createState() => _AdresIcerikState();
}

class _AdresIcerikState extends State<AdresIcerik> {
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
                        image: AssetImage('assets/konum.png'),
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
                                builder: (context) => AdreslerimHizmet()),
                          );
                        },
                        child: Text('Adresim',
                            style:
                                TextStyle(color: Colors.black, fontSize: 18))),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
              child: FlatButton(
                onPressed: () {},
                child: TextFormField(
                  // The validator receives the text that the user has entered.
                  decoration: InputDecoration(
                      focusColor: Color(0xFFEB3A18),
                      hintText: '1. Adres',
                      hintStyle:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Adres Boş Geçilemez!';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
              child: FlatButton(
                onPressed: () {},
                child: TextFormField(
                  // The validator receives the text that the user has entered.
                  decoration: InputDecoration(
                      focusColor: Color(0xFFEB3A18),
                      hintText: '2. Adres',
                      hintStyle:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Adres Boş Geçilemez!';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
              child: FlatButton(
                onPressed: () {},
                child: TextFormField(
                  // The validator receives the text that the user has entered.
                  decoration: InputDecoration(
                      focusColor: Color(0xFFEB3A18),
                      hintText: '3. Adres',
                      hintStyle:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Adres Boş Geçilemez!';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
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

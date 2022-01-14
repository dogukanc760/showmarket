import 'package:flutter/material.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1.dart';

class hvProfil extends StatelessWidget {
  const hvProfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: hvProfile(),
          ),
        ),
        bottomNavigationBar: NavigationBottom(),
      ),
    );
  }
}

class hvProfile extends StatefulWidget {
  const hvProfile({Key? key}) : super(key: key);

  @override
  _hvProfileState createState() => _hvProfileState();
}

class _hvProfileState extends State<hvProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              'Hizmet veren profili',
              style: TextStyle(
                  color: Color(0xFFEB3A18),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 120),
            child: Text(
              'İşletme Adı/Hizmet Veren Adı',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 250),
            child: Text(
              'Hizmet Sektörü',
              style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              height: 200,
              width: 240,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, color: Colors.black, offset: Offset(1, 3))
                ],
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(45),
                image: DecorationImage(
                    image: AssetImage('assets/profilResmi.png'),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 200.0),
            child: Text(
              'Müşteri Yorumları',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 269.0),
            child: Text(
              'Kullanıcı Adı',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1.0, right: 15, left: 30),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 280.0, top: 5),
            child: Text(
              'Hakkında',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1.0, right: 15, left: 30),
            child: Text(
              'Lrehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 265.0, top: 5),
            child: Text(
              'Referanslar',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      image: DecorationImage(
                          image: AssetImage('assets/imageIcon.png'),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(21),
                    ),
                    width: 90,
                    height: 90,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      image: DecorationImage(
                          image: AssetImage('assets/imageIcon.png'),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(21),
                    ),
                    width: 90,
                    height: 90,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      image: DecorationImage(
                          image: AssetImage('assets/imageIcon.png'),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(21),
                    ),
                    width: 90,
                    height: 90,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      image: DecorationImage(
                          image: AssetImage('assets/imageIcon.png'),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(21),
                    ),
                    width: 90,
                    height: 90,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              width: 250,
              height: 40,
              child: RaisedButton(
                textColor: Colors.black,
                color: Color(0xFFEB3A18),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      color: Color(0xFFEB3A18),
                      width: 5,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {},
                child: const Text(
                  'İletişime Geç',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

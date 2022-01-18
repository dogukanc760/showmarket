import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1.dart';
import 'package:http/http.dart' as http;

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

List<String> profile = [];

class Profilim extends StatefulWidget {
  const Profilim({Key? key}) : super(key: key);

  @override
  _ProfilimState createState() => _ProfilimState();
}
String username='';
String name = '';
String surname = '';
String gsm = '';
String userId='';
String responses = '';

Future<String> login(String mail, String gsm, String name) async {
  final response = await http.put(
    Uri.parse('https://showmarket-api.herokuapp.com/api/user/'+userId),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, String>{'gsm': mail, 'mail': mail, 'name': name}),
  );

  if (response.statusCode == 201) {
    print(response.statusCode);
    responses = '201';
    return '201';

  } else {
    return '500';
    throw Exception();
  }
}


class _ProfilimState extends State<Profilim> {
  final _formKey = GlobalKey<FormState>();


  bool _passwordVisible = true;
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
  final fullnameController = TextEditingController(text: name);
  final usernameController = TextEditingController(text: username);
  final gsmController = TextEditingController(text:gsm);


  @override
  void initState() {
    getSession();
    super.initState();
  }
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
                                name,
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
              controller: fullnameController,

              enableSuggestions: false,
              autocorrect: false,
              // The validator receives the text that the user has entered.
              decoration: InputDecoration(
                  focusColor: Color(0xFFEB3A18),
                  hintText: name.isEmpty?'Adınız ve Soyadınız':name,
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

              controller: usernameController,
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
              controller: gsmController,
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
                onPressed: () {
                  const success = SnackBar(
                    content: Text('Güncelleme Başarılı!'),
                  );
                  const failed = SnackBar(
                    content: Text('Güncelleme Başarısız!'),
                  );
                  String result = login(usernameController.text, gsmController.text, fullnameController.text).toString();
                  if(responses == '201'){
                    ScaffoldMessenger.of(context).showSnackBar(success);
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(failed);
                  }
                },
                child: const Text('Güncelle'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

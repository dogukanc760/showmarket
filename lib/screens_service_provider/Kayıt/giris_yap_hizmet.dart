import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showmarket/models/user_model.dart';
import 'package:showmarket/screens/anasayfa.dart';
import 'package:showmarket/screens/girissayfasi.dart';
import 'package:showmarket/screens_service_provider/Kay%C4%B1t/kayit_tercih.dart';
import 'package:showmarket/screens_service_provider/anasayfa_hv.dart';
import 'package:showmarket/screens_service_provider/karsilama_hizmet.dart';
import 'package:http/http.dart' as http;
import 'kayit_tercih.dart';

class GirisHizmet extends StatelessWidget {
  const GirisHizmet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFEB3A18),
        resizeToAvoidBottomInset: false,
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

Future<User>? _futureUser;
String username = "";
String password = "";
bool _showCircle = true;

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = true;

  final usernames = TextEditingController();
  final passwords = TextEditingController();

  @override
  void dispose() {
    usernames.dispose();
    passwords.dispose();
    super.dispose();
  }
  bool? rememberMe = false;
  void _onRememberMeChanged(bool? newValue) => setState(() {
    rememberMe = !rememberMe!;
    print(rememberMe);

  });
  Widget build(BuildContext context) {
    // Full screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var padding = MediaQuery.of(context).padding;
    double height1 = height - padding.top - padding.bottom;

// Height (without status bar)
    double height2 = height - padding.top;

// Height (without status and toolbar)
    double height3 = height - padding.top - kToolbarHeight;
Future<User> login(String mail, String password, BuildContext context) async {

  final response = await http.post(
    Uri.parse('https://showmarket-api.herokuapp.com/api/auth/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, String>{'gsm': mail, 'mail': mail, 'password': password}),
  );

  if (response.statusCode == 200) {
    statusCode = 200;
    print(response.statusCode);
    final prefs = await SharedPreferences.getInstance();
    var result = jsonDecode(response.body);
    print(result['data']);
    prefs.setString('username', result['data']['mail']);
    prefs.setString('name', result['data']['name']);
    prefs.setString('surname', result['data']['surname']);
    prefs.setString('gsm', result['data']['gsm']);
    prefs.setString('id', result['data']['_id']);
    prefs.setString('adress', jsonEncode(result['data']['adress']));
    prefs.setString('img', '');
   
    print(prefs.getString('adress'));
    foo(context);

    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception();
  }
}

    // Build a Form widget using the _formKey created above.
    return SafeArea(
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage('assets/1.Ekran-2.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    child: Image(
                      image: AssetImage('assets/logo.png'),
                      height: 250,
                      width: 250,
                      alignment: Alignment.center,
                    ),
                  ),
                ),

                Center(
                  child: Text(
                    'Giri??',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                    child: TextFormField(
                      controller: usernames,
                      keyboardType: TextInputType.text,
                      maxLength: 35,
                      style: TextStyle(fontSize: 14),
                      // The validator receives the text that the user has entered.
                      decoration: InputDecoration(
                        focusColor: Colors.amber,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email Adresi yada Gsm Numaras??',
                        hoverColor: null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: SizedBox(
                            width: 25,
                            height: 25,
                            child: Image(
                              image: AssetImage('assets/checked.png'),
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Gsm no veya Email Alan?? Bo?? Ge??ilemez!';
                        } else if (value != null) {
                          //BURAYA NULL DE??iLSE E??ER T??K ????ARET?? RENK DE??????ECEK
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                  child: TextFormField(
                    controller: passwords,
                    style: TextStyle(fontSize: 12),
                    obscureText: _passwordVisible,
                    enableSuggestions: false,
                    autocorrect: false,
                    // The validator receives the text that the user has entered.
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: '??ifre',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });

                          print(_passwordVisible);
                        },
                        icon: Icon(_passwordVisible
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined),
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '??ifre Bo?? Ge??ilemez!';
                      }
                      return null;
                    },
                  ),
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KayitTercih()),
                            );
                          },
                          child: Text(
                            'Kay??t Ol',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            '??ifrenizi mi unuttunuz?',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white54,
                                fontSize: 15),
                          )),
                    )
                  ],
                ),
                //Text Button gelecek kay??t ol ve ??ifremi unuttum
                Center(
                  child: Padding(padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
                    child: CheckboxListTile(
                      title: Text("Beni Hat??rla", style: TextStyle(color:Colors.white),),
                      value: rememberMe,
                      activeColor: Colors.black,
                      onChanged: _onRememberMeChanged,
                      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Center(
                    child: Container(
                      width: 310,
                      height: 45,
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.black,
                              width: 5,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        onPressed: () {
                          if (!username.isEmpty) {
                            final snackBar = SnackBar(
                              content: const Text(
                                  'Giri?? Ba??ar??l?? Y??nlendiriliyorsunuz...'),
                              action: SnackBarAction(
                                label: 'Kapat',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (username.length < 0) {
                            final snackBar = SnackBar(
                              content: const Text('Giri?? Ba??ar??s??z!'),
                              action: SnackBarAction(
                                label: 'Kapat',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                          final User user = new User(
                              username: usernames.text,
                              password: passwords.text,
                              mail: usernames.text,
                              gsm: usernames.text);
                          var result =
                              login(usernames.text, passwords.text, context);
                          setState(() {
                            _showCircle = !_showCircle;
                          });
                        },
                        child: const Text('Giri?? Yap'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Container(
                      width: 310,
                      height: 45,
                      child: RaisedButton(
                        textColor: Colors.black,
                        color: Colors.amberAccent,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.amberAccent,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GirisSayfasi()),
                          );
                        },
                        child: const Text('Hizmet Alan Giri??i'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

FutureBuilder<User> buildFutureBuilder() {
  return FutureBuilder<User>(
    future: _futureUser,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data!.username);
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }

      return const CircularProgressIndicator();
    },
  );
}

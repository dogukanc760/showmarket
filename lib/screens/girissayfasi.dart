import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showmarket/models/user_model.dart';
import 'package:showmarket/screens_service_provider/Kay%C4%B1t/giris_yap_hizmet.dart';
import 'package:http/http.dart' as http;

import 'karsilama.dart';
import 'kayit_ol.dart';
 Future<void> loginUniversal(String mail, String password, BuildContext context) async {

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
    prefs.setString('img', result['data']['img']);
  
    
    print(prefs.getString('adress'));
    foo(context);


  } else {
    throw Exception();
  }
}

class GirisSayfasi extends StatelessWidget {
  const GirisSayfasi({Key? key}) : super(key: key);

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
int statusCode = 0;
String usernameSession = "";
String userId = "";
String passwordSave = "";


// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final usernames = TextEditingController();
  final passwords = TextEditingController();
void getSession() async {
  final prefs = await SharedPreferences.getInstance();
  userId = prefs.getString('sessionId').toString();
  usernameSession = prefs.getString('usernameSession').toString();
  passwordSave = prefs.getString('passwordSave').toString();
  print(userId + "denme");
}


void addSession(String usernameSession, String passwordSession, String userIdSession) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('usernameSession', usernameSession);
  prefs.setString('passwordSave', passwordSession);
  prefs.setString('sessionId', userIdSession);
}
  bool _passwordVisible = true;
  bool rememberMe = false;
  bool showCircle = false;
  void _onRememberMeChanged(bool? newValue) => setState(() {
    rememberMe = !rememberMe;
    print(rememberMe);

  });
  @override
  void dispose() {
    usernames.dispose();
    passwords.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
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
    prefs.setString('img', result['data']['img']);
    if(rememberMe){
      print('beni hatırla');
        addSession(usernames.text.toString(), passwords.text.toString(), result['data']['_id']);
        print('hatırladım');
    }
    else{
      print('beni hatırlama');
    }
    print(prefs.getString('adress'));
    foo(context);

    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception();
  }
}

    // Full screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool? checkedValue = false;
    var padding = MediaQuery.of(context).padding;
    double height1 = height - padding.top - padding.bottom;

// Height (without status bar)
    double height2 = height - padding.top;

// Height (without status and toolbar) 
    double height3 = height - padding.top - kToolbarHeight;

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
                    'Giriş',
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
                        hintText: 'Email Adresi yada Gsm Numarası',
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
                          return 'Gsm no veya Email Alanı Boş Geçilemez!';
                        } else if (value != null) {
                          //BURAYA NULL DEĞiLSE EĞER TİK İŞARETİ RENK DEĞİŞECEK
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
                      hintText: 'Şifre',
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
                        return 'Şifre Boş Geçilemez!';
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
                                  builder: (context) => KayitOl()),
                            );
                          },
                          child: Text(
                            'Kayıt Ol',
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
                            'Şifrenizi mi unuttunuz?',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white54,
                                fontSize: 15),
                          )),
                    )
                  ],
                ),
                //Text Button gelecek kayıt ol ve şifremi unuttum
                Center(
                  child: Padding(padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
                    child: CheckboxListTile(
                      title: Text("Beni Hatırla", style: TextStyle(color:Colors.white),),
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

                              CircularProgressIndicator();
                          if (!username.isEmpty) {
                            final snackBar = SnackBar(
                              content: const Text(
                                  'Giriş Başarılı Yönlendiriliyorsunuz...'),
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
                              content: const Text('Giriş Başarısız!'),
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
                        child: const Text('Giriş Yap'),
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
                                builder: (context) => GirisHizmet()),
                          );
                        },
                        child: const Text('Hizmet Veren Girişi'),
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


void foo(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  username = prefs.getString('username').toString();

  if (!username.isEmpty) {
    print(prefs.getString('username').toString());
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Karsilama()),
    );
  } else {
    print("boş");
  }
}

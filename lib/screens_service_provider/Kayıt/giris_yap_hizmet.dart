import 'package:flutter/material.dart';
import 'package:showmarket/screens/girissayfasi.dart';
import 'package:showmarket/screens_service_provider/Kay%C4%B1t/kayit_tercih.dart';
import 'package:showmarket/screens_service_provider/karsilama_hizmet.dart';

import 'kayit_tercih.dart';

class GirisHizmet extends StatelessWidget {
  const GirisHizmet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFEB3A18),
        resizeToAvoidBottomInset: true,
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

  @override
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
                      padding: EdgeInsets.only(left: 30),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KayitTercih()),
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

                Padding(
                  padding: const EdgeInsets.only(top: 20),
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
                          // Validate returns true if the form is valid, or false otherwise.
                          /* if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }*/
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Karsilama_Hizmet()),
                          );
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
                          // Validate returns true if the form is valid, or false otherwise.
                          /* if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }*/
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GirisSayfasi()),
                          );
                        },
                        child: const Text('Hizmet Alan Girişi'),
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

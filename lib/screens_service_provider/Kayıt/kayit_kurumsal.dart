import 'package:flutter/material.dart';
import 'package:showmarket/screens_service_provider/Kay%C4%B1t/kayit_tamamlama.dart';
import 'package:url_launcher/url_launcher.dart';

class KurumsalKayit extends StatelessWidget {
  const KurumsalKayit({Key? key}) : super(key: key);

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
  bool _offer = false;

  _launchURL() async {
    const url = 'https://docs.google.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
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
                  'Kurumsal Kayıt',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: TextFormField(
                    style: TextStyle(fontSize: 14),
                    // The validator receives the text that the user has entered.
                    decoration: InputDecoration(
                      focusColor: Colors.amber,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '   İşyeri Ünvanı',
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
                        return 'İşyeri Ünvanı Alanı Boş Geçilemez!';
                      } else if (value != null) {
                        //BURAYA NULL DEĞiLSE EĞER TİK İŞARETİ RENK DEĞİŞECEK
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                  child: TextFormField(
                    style: TextStyle(fontSize: 14),
                    // The validator receives the text that the user has entered.
                    decoration: InputDecoration(
                      focusColor: Colors.amber,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '   Vergi Numarası',
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
                        return 'Vergi Numarası Alanı Boş Geçilemez!';
                      } else if (value != null) {
                        //BURAYA NULL DEĞiLSE EĞER TİK İŞARETİ RENK DEĞİŞECEK
                      }
                      return null;
                    },
                  ),
                ),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                  child: TextFormField(
                    style: TextStyle(fontSize: 14),
                    // The validator receives the text that the user has entered.
                    decoration: InputDecoration(
                      focusColor: Colors.amber,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '   Adınız ve Soyadınız',
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
                        return 'Adınız ve Soyadınız Alanı Boş Geçilemez!';
                      } else if (value != null) {
                        //BURAYA NULL DEĞiLSE EĞER TİK İŞARETİ RENK DEĞİŞECEK
                      }
                      return null;
                    },
                  ),
                ),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                  child: TextFormField(
                    style: TextStyle(fontSize: 14),
                    // The validator receives the text that the user has entered.
                    decoration: InputDecoration(
                      focusColor: Colors.amber,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '   Email Adresiniz',
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
                        return 'Email Alanı Boş Geçilemez!';
                      } else if (value != null) {
                        //BURAYA NULL DEĞiLSE EĞER TİK İŞARETİ RENK DEĞİŞECEK
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                  child: TextFormField(
                    style: TextStyle(fontSize: 14),
                    // The validator receives the text that the user has entered.
                    decoration: InputDecoration(
                      focusColor: Colors.amber,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '   Gsm Numarası',
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
                        return 'Gsm Alanı Boş Geçilemez!';
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
                    hintText: '   Şifrenizi Oluşturunuz',
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

              Column(
                children: [
                  CheckboxListTile(
                    selected: true,
                    title: TextButton(
                      onPressed: () {
                        if (_offer == true) {
                          _launchURL();
                        }
                        return _launchURL();
                      },
                      child: Text(
                        'Üyelik Sözleşmesini ve KVKK Aydınlatma metnini okudum, kabul ediyorum.',
                        style: TextStyle(
                            fontSize: 10, color: Colors.grey.shade400),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    value: _offer,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (newValue) {
                      print("1");

                      setState(() {
                        _offer = !_offer;
                      });
                    },
                  ),
                ],
              ),
              //Text Button gelecek kayıt ol ve şifremi unuttum

              Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 40),
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
                              builder: (context) => ProfilTamamla()),
                        );
                      },
                      child: const Text('Kayıt Ol'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

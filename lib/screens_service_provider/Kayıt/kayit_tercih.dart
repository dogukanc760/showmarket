import 'package:flutter/material.dart';
import 'package:showmarket/screens_service_provider/Kay%C4%B1t/kayit_bireysel.dart';
import 'package:showmarket/screens_service_provider/Kay%C4%B1t/kayit_kurumsal.dart';

class KayitTercih extends StatelessWidget {
  const KayitTercih({Key? key}) : super(key: key);

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
  bool _isSelected = false;

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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          _isSelected = false;
                        });
                      },
                      child: TextFormField(
                        enabled: false,
                        // The validator receives the text that the user has entered.
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          hintText: 'Bireysel Çalışıyorum',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: _isSelected == false
                                ? Icon(Icons.check)
                                : Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Gsm no veya Email Alanı Boş Geçilemez!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          _isSelected = true;
                        });
                      },
                      child: TextFormField(
                        enabled: false,
                        // The validator receives the text that the user has entered.
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          hintText: 'Kurumsal Çalışıyorum',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: _isSelected == true
                                ? Icon(Icons.check)
                                : Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Gsm no veya Email Alanı Boş Geçilemez!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Lütfen başvuru türünü seçin.',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade100,
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
                      width: 250,
                      height: 50,
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
                          /*  Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Karsilama()),
                          );*/
                          if (_isSelected == true) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KurumsalKayit()),
                            );
                          }
                          if (_isSelected == false) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BireyselKayit()),
                            );
                          }
                        },
                        child: const Text('Devam Et'),
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

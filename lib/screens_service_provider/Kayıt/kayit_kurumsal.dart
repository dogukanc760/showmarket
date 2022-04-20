import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showmarket/models/user_model.dart';
import 'package:showmarket/screens_service_provider/Kay%C4%B1t/giris_yap_hizmet.dart';
import 'package:showmarket/screens_service_provider/Kay%C4%B1t/kayit_tamamlama.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'dart:convert';

String username = '';
final gsm = TextEditingController();
final password = TextEditingController();
final mail = TextEditingController();
final fullName = TextEditingController();
final taxnumber = TextEditingController();
final companyName = TextEditingController();

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

showAlertDialogFailed(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Kayıt Başarısız!"),
    content: Text("Bilgilerinizi kontrol edin."),
    actions: [],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
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
      MaterialPageRoute(builder: (context) => GirisHizmet()),
    );
  } else {
    print("boş");
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
  var isLoading = false;
  int statusCode = 0;
  late File _image;
  final picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  _launchURL() async {
    const url = 'https://docs.google.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  upload(File imageFile) async {
    // open a bytestream
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse("http://192.168.0.8:3000/upload");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('myFile', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  bool isloaded = false;
  var result;
  fetch() async {
    var response = await http.get(Uri.parse("https://showmarket-api.herokuapp.com/api/uploadImage"));
    result = jsonDecode(response.body);
    print(result[0]['image']);
    setState(() {
      isloaded = true;
    });
  }

  Future<User> register(String mail, String password, String fullname,
      String gsm, String company, String taxNum, BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    final response = await http.post(
      Uri.parse(
          'https://showmarket-api.herokuapp.com/api/auth/register-business'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'gsm': gsm,
        'mail': mail,
        'name': fullname,
        'surname': fullname,
        'password': password,
        'company': company,
        'taxNum': taxNum
      }),
    );

    if (response.statusCode == 201) {
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
      setState(() {
        isLoading = false;
      });
      foo(context);

      return User.fromJson(jsonDecode(response.body));
    } else {
      setState(() {
        isLoading = false;
      });
      showAlertDialogFailed(context);
      throw Exception();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return SafeArea(
      child: SingleChildScrollView(
        child: isLoading
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 350, 0, 0),
                child: Column(
                  children: [
                    Center(child: CircularProgressIndicator()),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'İşlem Yapılıyor...',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ))
                  ],
                ),
              )
            : Form(
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
                          controller: companyName,
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
                          controller: taxnumber,
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
                          controller: fullName,
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
                          controller: mail,
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
                          controller: gsm,
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
                        controller: password,
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
                    Container(
                      color:Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Belge Seçin"),
                          FlatButton.icon(
                              onPressed: () async => await getImage(),
                              icon: Icon(Icons.upload_file),
                              label: Text("Dosyalarım")),
                          SizedBox(
                            height: 20,
                          ),
                          FlatButton.icon(
                              onPressed: () => upload(_image),
                              icon: Icon(Icons.upload_rounded),
                              label: Text("Şimdi Yükle")),
                          isloaded
                              ? Image.network('https://showmarket-api.herokuapp.com/images/${result[0]['image']}')
                              : Text(''),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 40),
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
                              register(
                                  mail.text,
                                  password.text,
                                  fullName.text,
                                  gsm.text,
                                  companyName.text,
                                  taxnumber.text,
                                  context);
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

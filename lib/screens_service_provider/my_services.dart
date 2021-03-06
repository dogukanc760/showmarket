import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1_Hizmet.dart';
import 'package:http/http.dart' as http;
import 'package:showmarket/models/category.dart';
import 'package:showmarket/models/sector.dart';
import 'package:showmarket/models/service_new.dart';
import 'package:showmarket/screens/yeni_hizmet.dart';

List<Service> serviceList = [];
List<Sector> sectors = [];
List<Category> categories = [];
List<String> categoriesSt = [];
List<String> sectorsSt = [];
String userId = '';
String sector = '';
String category = '';
var isLoading = false;
var cityController = TextEditingController();
var aboutController = TextEditingController();
var priceOneController = TextEditingController();
var priceTwoController = TextEditingController();
var personCountController = TextEditingController();
var descriptionController = TextEditingController();
var nameController = TextEditingController();
bool isloaded = false;
late File _image;
var result;

class MyServices extends StatefulWidget {
  const MyServices({Key? key}) : super(key: key);

  @override
  State<MyServices> createState() => _MyServicesState();
}

final picker = ImagePicker();

class _MyServicesState extends State<MyServices> {
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

  void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Material(
              child: SizedBox(
                width: 550,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 65,
                          width: MediaQuery.of(context).size.width,
                          child: DropdownSearch<String>(
                            validator: (v) =>
                                v == null ? "required field" : null,
                            mode: Mode.MENU,
                            dropdownSearchDecoration: InputDecoration(
                              icon: Icon(Icons.category),
                              fillColor: Colors.white,
                              hoverColor: Colors.white,
                              hintText: "Se??ilmesi Zorunlu Alan",
                              hintStyle: TextStyle(fontSize: 12),
                              labelText: "Kategori",
                              labelStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold),
                              filled: true,
                              border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF01689A)),
                              ),
                            ),
                            showAsSuffixIcons: true,
                            clearButtonBuilder: (_) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Icon(
                                Icons.clear,
                                size: 24,
                                color: Colors.black,
                              ),
                            ),
                            dropdownButtonBuilder: (_) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 35,
                                color: Colors.black,
                              ),
                            ),
                            showSelectedItems: true,
                            items: categoriesSt,
                            showClearButton: true,
                            onChanged: (value) {
                              setState(() {
                                category = value.toString();
                              });
                              print(category + "category");
                              getSector(category);
                            },
                            popupItemDisabled: (String? s) =>
                                s?.startsWith('I') ?? true,
                          ),
                        ),
                        SizedBox(
                          height: 65,
                          width: MediaQuery.of(context).size.width,
                          child: DropdownSearch<String>(
                            validator: (v) =>
                                v == null ? "required field" : null,
                            mode: Mode.MENU,
                            dropdownSearchDecoration: InputDecoration(
                              icon: Icon(Icons.local_fire_department_sharp),
                              fillColor: Colors.white,
                              hoverColor: Colors.white,
                              hintText: "Se??ilmesi Zorunlu Alan",
                              hintStyle: TextStyle(fontSize: 12),
                              labelText: "Sekt??r",
                              labelStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold),
                              filled: true,
                              border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF01689A)),
                              ),
                            ),
                            showAsSuffixIcons: true,
                            clearButtonBuilder: (_) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Icon(
                                Icons.clear,
                                size: 24,
                                color: Colors.black,
                              ),
                            ),
                            dropdownButtonBuilder: (_) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 35,
                                color: Colors.black,
                              ),
                            ),
                            showSelectedItems: true,
                            items: sectorsSt,
                            showClearButton: true,
                            onChanged: (value) {
                              setState(() {
                                sector = value.toString();
                              });
                              print(sector + "sekt??r");
                            },
                            popupItemDisabled: (String? s) =>
                                s?.startsWith('I') ?? true,
                          ),
                        ),
                        TextField(
                          controller: nameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            icon: Icon(Icons.drive_file_rename_outline),
                            labelText: 'Hizmet Ad??',
                          ),
                        ),
                        TextField(
                          controller: cityController,
                          obscureText: false,
                          decoration: InputDecoration(
                            icon: Icon(Icons.location_city),
                            labelText: '??ehir',
                          ),
                        ),
                        TextField(
                          controller: aboutController,
                          obscureText: false,
                          decoration: InputDecoration(
                            icon: Icon(Icons.app_blocking_outlined),
                            labelText: 'Hakk??nda Yaz??s??',
                          ),
                        ),
                        TextField(
                          controller: priceOneController,
                          obscureText: false,
                          decoration: InputDecoration(
                            icon: Icon(Icons.price_change),
                            labelText: 'Fiyat',
                          ),
                        ),
                        TextField(
                          controller: priceTwoController,
                          obscureText: false,
                          decoration: InputDecoration(
                            icon: Icon(Icons.price_change_sharp),
                            labelText: '??kinci Fiyat',
                          ),
                        ),
                        TextField(
                          controller: personCountController,
                          obscureText: false,
                          decoration: InputDecoration(
                            icon: Icon(Icons.supervisor_account),
                            labelText: 'Ki??i Say??s??',
                          ),
                        ),
                        TextField(
                          controller: descriptionController,
                          obscureText: false,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.description,
                            ),
                            labelText: 'A????klama',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Hizmete ait g??rseller ve videolar \n (se??ti??iniz b??t??n g??rseller an??nda kaydedilir)',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16), textAlign:TextAlign.center,),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Colors.deepOrange),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //  Text("Belge Se??in", style:TextStyle(color: Colors.white)),
                              FlatButton.icon(
                                onPressed: () async => await getImage(),
                                icon: Icon(Icons.upload_file),
                                label: Text("Dosyalar??m",
                                    style: TextStyle(color: Colors.white)),
                              ),

                              FlatButton.icon(
                                  onPressed: () => upload(_image),
                                  icon: Icon(Icons.upload_rounded, size: 14),
                                  label: Text("??imdi Y??kle",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14))),
                              isloaded
                                  ? Image.network(
                                      'https://showmarket-api.herokuapp.com/images/${result[0]['image']}')
                                  : Text(''),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            width: 250,
                            child: FlatButton(
                                color: Colors.deepOrange,
                                onPressed: () => createService(
                                    nameController.text,
                                    cityController.text,
                                    aboutController.text,
                                    priceOneController.text,
                                    priceTwoController.text,
                                    personCountController.text,
                                    descriptionController.text,
                                    context),
                                child: Text(
                                  "Olu??tur",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ), //SizedBox.expand(child: FlutterLogo()),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40)),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  Future<void> getCategory() async {
    setState(() {
      categories.clear();
      categoriesSt.clear();
      isLoading = true;
    });
    categories.clear();
    final response = await http.get(
      Uri.parse('https://showmarket-api.herokuapp.com/api/category'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print(response.statusCode);

      var result = jsonDecode(response.body);
      print(result['data']);
      //  print(result['data'][0]['_id']);
      for (var i = 0; i < result['data'].length; i++) {
        setState(() {
          categories.add(Category(
              name: result['data'][i]['name'],
              img: result['data'][i]['img'],
              isActive: result['data'][i]['isActive'],
              showHome: result['data'][i]['showHome'],
              id: result['data'][i]['_id']));
          categoriesSt.add(result['data'][i]['name']);
        });
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception();
    }
  }

  Future<void> getSector(String categoryName) async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(
      Uri.parse(
          'https://showmarket-api.herokuapp.com/api/sector/get-by-category/' +
              categoryName),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print(response.statusCode);

      var result = jsonDecode(response.body);
      print(result['data']);
      //  print(result['data'][0]['_id']);
      if (result['data'].length > 0) {
        setState(() {
          for (var i = 0; i < result.length - 1; i++) {
            sectors.add(Sector(
                category: result['data'][i]['category'].cast<String>(),
                name: result['data'][i]['name'],
                id: result['data'][i]['_id']));
            sectorsSt.add(result['data'][i]['name']);
          }
        });
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception();
    }
  }

  success(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "????lem Ba??ar??l??!",
      desc: "Yeni Hizmet Ba??ar??yla Olu??turuldu",
      buttons: [
        DialogButton(
          child: Text(
            "Kapat",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => null,
          width: 120,
        )
      ],
    ).show();
  }

  error(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "????lem Ba??ar??s??z!",
      desc: "Alanlar?? kontrol ederek tekrar deneyiniz!",
      buttons: [
        DialogButton(
          child: Text(
            "Dismiss",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => null,
          width: 120,
        )
      ],
    ).show();
  }

  nullError(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "????lem Ba??ar??s??z!",
      desc: "Alanlar Bo?? Ge??ilemez!",
      buttons: [
        DialogButton(
          child: Text(
            "Dismiss",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => null,
          width: 120,
        )
      ],
    ).show();
  }

  _openPopup(BuildContext context) {
    Alert(
        context: context,
        title: "Yeni Hizmet Olu??turma",
        content: Container(
          height: 550,
          width: 250,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 65,
                  width: 250,
                  child: DropdownSearch<String>(
                    validator: (v) => v == null ? "required field" : null,
                    mode: Mode.MENU,
                    dropdownSearchDecoration: InputDecoration(
                      icon: Icon(Icons.category),
                      fillColor: Colors.white,
                      hoverColor: Colors.white,
                      hintText: "Se??ilmesi Zorunlu Alan",
                      hintStyle: TextStyle(fontSize: 12),
                      labelText: "Kategori",
                      labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold),
                      filled: true,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF01689A)),
                      ),
                    ),
                    showAsSuffixIcons: true,
                    clearButtonBuilder: (_) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(
                        Icons.clear,
                        size: 24,
                        color: Colors.black,
                      ),
                    ),
                    dropdownButtonBuilder: (_) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 35,
                        color: Colors.black,
                      ),
                    ),
                    showSelectedItems: true,
                    items: categoriesSt,
                    showClearButton: true,
                    onChanged: (value) {
                      setState(() {
                        category = value.toString();
                      });
                      print(category + "category");
                      getSector(category);
                    },
                    popupItemDisabled: (String? s) =>
                        s?.startsWith('I') ?? true,
                  ),
                ),
                SizedBox(
                  height: 65,
                  width: 250,
                  child: DropdownSearch<String>(
                    validator: (v) => v == null ? "required field" : null,
                    mode: Mode.MENU,
                    dropdownSearchDecoration: InputDecoration(
                      icon: Icon(Icons.local_fire_department_sharp),
                      fillColor: Colors.white,
                      hoverColor: Colors.white,
                      hintText: "Se??ilmesi Zorunlu Alan",
                      hintStyle: TextStyle(fontSize: 12),
                      labelText: "Sekt??r",
                      labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold),
                      filled: true,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF01689A)),
                      ),
                    ),
                    showAsSuffixIcons: true,
                    clearButtonBuilder: (_) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(
                        Icons.clear,
                        size: 24,
                        color: Colors.black,
                      ),
                    ),
                    dropdownButtonBuilder: (_) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 35,
                        color: Colors.black,
                      ),
                    ),
                    showSelectedItems: true,
                    items: sectorsSt,
                    showClearButton: true,
                    onChanged: (value) {
                      setState(() {
                        sector = value.toString();
                      });
                      print(sector + "sekt??r");
                    },
                    popupItemDisabled: (String? s) =>
                        s?.startsWith('I') ?? true,
                  ),
                ),
                TextField(
                  controller: nameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.drive_file_rename_outline),
                    labelText: 'Hizmet Ad??',
                  ),
                ),
                TextField(
                  controller: cityController,
                  obscureText: false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.location_city),
                    labelText: '??ehir',
                  ),
                ),
                TextField(
                  controller: aboutController,
                  obscureText: false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.app_blocking_outlined),
                    labelText: 'Hakk??nda Yaz??s??',
                  ),
                ),
                TextField(
                  controller: priceOneController,
                  obscureText: false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.price_change),
                    labelText: 'Fiyat',
                  ),
                ),
                TextField(
                  controller: priceTwoController,
                  obscureText: false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.price_change_sharp),
                    labelText: '??kinci Fiyat',
                  ),
                ),
                TextField(
                  controller: personCountController,
                  obscureText: false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.supervisor_account),
                    labelText: 'Ki??i Say??s??',
                  ),
                ),
                TextField(
                  controller: descriptionController,
                  obscureText: false,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.description,
                    ),
                    labelText: 'A????klama',
                  ),
                ),
              ],
            ),
          ),
        ),
        buttons: [
          DialogButton(
            color: Colors.deepOrange,
            onPressed: () => createService(
                nameController.text,
                cityController.text,
                aboutController.text,
                priceOneController.text,
                priceTwoController.text,
                personCountController.text,
                descriptionController.text,
                context),
            child: Text(
              "Olu??tur",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  Future<void> createService(
      String name,
      String city,
      String about,
      String price,
      String priceTwo,
      String personCount,
      String description,
      BuildContext context) async {
    int priceOnee = 0;
    int priceTwoo = 0;
    int rating = 0;
    int ratingCount = 0;
    priceOnee = int.parse(price);
    priceTwoo = int.parse(priceTwo);
    setState(() {
      isLoading = true;
    });
    if (name.isEmpty ||
        about.isEmpty ||
        price.isEmpty ||
        priceTwo.isEmpty ||
        personCount.isEmpty ||
        description.isEmpty) {
      nullError(context);
    } else {
      final response = await http.post(
        Uri.parse('https://showmarket-api.herokuapp.com/api/service'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'user': userId,
          'name': name,
          'sector': sector,
          'category': category,
          'city': city,
          'about': about,
          'price': priceOnee,
          'priceTwo': priceTwoo,
          'personCount': personCount,
          'description': description,
          'img': 'x',
          'companyName': name,
          'answer': 'x',
          'question': 'x',
          'distinct': 'x',
          'title': name,
          'rating': rating,
          'ratingCount': ratingCount,
          'comments': 'x',
          'isActive': true,
          'showHome': true,
          'descImg': 'x',
          'descVideos': 'x'
        }),
      );

      if (response.statusCode == 201) {
        print(response.statusCode);
        final prefs = await SharedPreferences.getInstance();
        var result = jsonDecode(response.body);
        print(result);

        setState(() {
          isLoading = false;
        });
        success(context);
      } else {
        setState(() {
          isLoading = false;
          print(isLoading);
        });
        error(context);
        throw Exception();
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    print(userIdd + "asdfasdfasdfafsd");
    super.initState();
    getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.deepOrange,
          title: Text("Hizmetlerim ve Yeni Hizmet Olu??turma",
              style: TextStyle(fontSize: 16)),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    showCustomDialog(context);
                    // _openPopup(context);
                    /*  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => YeniHizmet()),
                    );*/
                    print('appbar');
                  },
                  child: Icon(Icons.add_business_rounded),
                )),
          ],
        ),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          top: true,
          bottom: true,
          left: true,
          right: true,
          child: SingleChildScrollView(
            child: Stack(
              children: [Content()],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBottom(),
      ),
    );
  }
}

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  success(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "????lem Ba??ar??l??!",
      desc: "Hizmet Ba??ar??yla Silindi!",
      buttons: [
        DialogButton(
          child: Text(
            "Kapat",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => null,
          width: 120,
        )
      ],
    ).show();
  }

  error(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "????lem Ba??ar??s??z!",
      desc: "Silinme s??ras??nda hata olu??tu!",
      buttons: [
        DialogButton(
          child: Text(
            "Dismiss",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => null,
          width: 120,
        )
      ],
    ).show();
  }

  nullError(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "????lem Ba??ar??s??z!",
      desc: "Alanlar Bo?? Ge??ilemez!",
      buttons: [
        DialogButton(
          child: Text(
            "Dismiss",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => null,
          width: 120,
        )
      ],
    ).show();
  }

  Future<void> deleteService(
      int index, String serviceId, BuildContext context) async {
    // service id ile api call at index ile listeden sli state nesnesi ile
    setState(() {
      serviceList.removeAt(index);
    });
    final response = await http.delete(
      Uri.parse(
          'https://showmarket-api.herokuapp.com/api/service/' + serviceId),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      serviceList.clear();
      var result = jsonDecode(response.body);
      print(result['data']);
      success(context);
      //  print(result['data'][0]['_id']);

    } else {
      error(context);
      throw Exception();
    }
  }

  Future<void> getService() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('id').toString();
    });
    print(userId);
    final response = await http.get(
      Uri.parse(
          'https://showmarket-api.herokuapp.com/api/service/get-by-user/$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      serviceList.clear();
      var result = jsonDecode(response.body);
      print(result['data']);
      //  print(result['data'][0]['_id']);
      if (result['data'].length > 0) {
        setState(() {
          for (var i = 0; i < result['data'].length; i++) {
            serviceList.add(Service(
                id: result['data'][i]['_id'],
                title: result['data'][i]['title'],
                sector: result['data'][i]['sector'].cast<String>(),
                ratingCount: result['data'][i]['ratingCount'],
                rating: result['data'][i]['rating'],
                questions: result['data'][i]['questions'].cast<String>(),
                priceTwo: result['data'][i]['priceTwo'],
                personCount: result['data'][i]['personCount'],
                name: result['data'][i]['name'],
                img: result['data'][i]['img'],
                distinct: result['data'][i]['distinct'].cast<String>(),
                descVideos: result['data'][i]['descVideos'].cast<String>(),
                descImg: result['data'][i]['descImg'].cast<String>(),
                companyName: result['data'][i]['companyName'],
                comments: result['data'][i]['comments'].cast<String>(),
                about: result['data'][i]['about'],
                description: result['data'][i]['description'],
                answer: result['data'][i]['answer'].cast<String>(),
                user: result['data'][i]['user'],
                price: result['data'][i]['price'],
                category: result['data'][i]['category'].cast<String>(),
                city: result['data'][i]['city'].cast<String>()));
          }
        });
      }
    } else {
      throw Exception();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(userId + "12asdasdasd");
    getService();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SizedBox(
          height: 750,
          width: 500,
          child: serviceList.length > 0
              ? ListView.builder(
                  itemCount: serviceList.length, //serviceList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(
                            serviceList[index].name,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          leading: CircleAvatar(
                            child: Text(
                              'Aktif',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          trailing: TextButton(
                              onPressed: () => deleteService(
                                  index, serviceList[index].id, context),
                              child: Icon(Icons.delete, size: 32)),
                        ),
                      ),
                    );
                  },
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '??uanda aktif olarak kay??tl?? bir hizmetiniz bulunmamaktad??r.',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                        onPressed: null,
                        child: Text(
                          'Buraya t??klayarak anasayfaya d??nebilirsiniz...',
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
        ));
  }
}

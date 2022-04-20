import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1.dart';
import 'package:showmarket/models/category.dart';
import 'package:showmarket/models/sector.dart';
import 'package:showmarket/models/service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';

class YeniHizmet extends StatefulWidget {
  const YeniHizmet({Key? key}) : super(key: key);

  @override
  _YeniHizmetState createState() => _YeniHizmetState();
}

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
String username = '';
String namee = '';
String surname = '';
String adress = '';
String img = '';
String gsm = '';
String userIdd = '';
String responses = '';

class _YeniHizmetState extends State<YeniHizmet> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategory();
    getSession();
  }
  void getSession() async {

    final prefs = await SharedPreferences.getInstance();
    setState(() {
      img = prefs.getString('img').toString();
      username = prefs.getString('username').toString();
      namee = prefs.getString('name').toString();
      surname = prefs.getString('surname').toString();
      gsm = prefs.getString('gsm').toString();
      userIdd = prefs.getString('id').toString();
      adress = prefs.getString('adress').toString();
      adress = jsonDecode(adress)[0];
    });

    print(userIdd+ username + namee);

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
      title: "İşlem Başarılı!",
      desc: "Yeni Hizmet Başarıyla Oluşturuldu",
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
      title: "İşlem Başarısız!",
      desc: "Alanları kontrol ederek tekrar deneyiniz!",
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
      title: "İşlem Başarısız!",
      desc: "Alanlar Boş Geçilemez!",
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
          'user': userIdd,
          'name': name,
          'sector': sector,
          'category': category,
          'city': city,
          'about': about,
          'price': priceOnee,
          'priceTwo':priceTwoo,
          'personCount': personCount,
          'description': description,
          'img':'x',
          'companyName':namee,
          'answer':'x',
          'question':'x',
          'distinct':'x',
          'title':name,
          'rating':rating,
          'ratingCount':ratingCount,
          'comments':'x',
          'isActive':true,
          'showHome':true,
          'descImg':'x',
          'descVideos':'x'


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
              children: [
                Container(
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width*0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text('Yeni Hizmet Oluşturma',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold)),
                          ),
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
                                hintText: "Seçilmesi Zorunlu Alan",
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
                                hintText: "Seçilmesi Zorunlu Alan",
                                hintStyle: TextStyle(fontSize: 12),
                                labelText: "Sektör",
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
                                print(sector + "sektör");
                              },
                              popupItemDisabled: (String? s) =>
                                  s?.startsWith('I') ?? true,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: TextField(
                              controller: nameController,
                              obscureText: false,
                              decoration: InputDecoration(
                                icon: Icon(Icons.drive_file_rename_outline),
                                labelText: 'Hizmet Adı',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: TextField(
                              controller: cityController,
                              obscureText: false,
                              decoration: InputDecoration(
                                icon: Icon(Icons.location_city),
                                labelText: 'Şehir',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: TextField(
                              controller: aboutController,
                              obscureText: false,
                              decoration: InputDecoration(
                                icon: Icon(Icons.app_blocking_outlined),
                                labelText: 'Hakkında Yazısı',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: TextField(
                              controller: priceOneController,
                              obscureText: false,
                              decoration: InputDecoration(
                                icon: Icon(Icons.price_change),
                                labelText: 'Fiyat',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: TextField(
                              controller: priceTwoController,
                              obscureText: false,
                              decoration: InputDecoration(
                                icon: Icon(Icons.price_change_sharp),
                                labelText: 'İkinci Fiyat',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: TextField(
                              controller: personCountController,
                              obscureText: false,
                              decoration: InputDecoration(
                                icon: Icon(Icons.supervisor_account),
                                labelText: 'Kişi Sayısı',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: TextField(
                              controller: descriptionController,
                              obscureText: false,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.description,
                                ),
                                labelText: 'Açıklama',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
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
                                    "Oluştur",
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
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBottom(),
      ),
    );
  }
}

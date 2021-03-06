import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1.dart';
import 'package:showmarket/models/category.dart';
import 'package:showmarket/screens/hizmetkarsilama.dart';
import 'package:http/http.dart' as http;

final List<String> categoryList = [
  '',
  'Sinema',
  'Tiyatro',
  'Doğum Günü',
  'Dans',
  'Müzik',
  'Sportif',
  'LunaPark',
  'Sirk',
  'Geziler',
  'Açık Alan',
  'Kapalı Alan',
];
final List<Category> category = [];

class Kategoriler extends StatefulWidget {
  const Kategoriler({Key? key}) : super(key: key);

  @override
  _KategorilerState createState() => _KategorilerState();
}

class _KategorilerState extends State<Kategoriler> {
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
              children: [KategoriListe()],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBottom(),
      ),
    );
  }
}

class KategoriListe extends StatefulWidget {
  const KategoriListe({Key? key}) : super(key: key);

  @override
  _KategoriListeState createState() => _KategoriListeState();
}

class _KategoriListeState extends State<KategoriListe> {
  Future<ListView> getCategory() async {
    category.clear();
    final response = await http.get(
      Uri.parse('https://showmarket-api.herokuapp.com/api/category'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print(response.statusCode);

      var result = jsonDecode(response.body);

      //  print(result['data'][0]['_id']);
      print(result['data']);
      for (var i = 0; i < result['data'].length; i++) {
        setState(() {
          category.add(Category(
              name: result['data'][i]['name'],
              img: result['data'][i]['img'],
              isActive: result['data'][i]['isActive'],
              showHome: result['data'][i]['showHome'],
              id: result['data'][i]['_id']));
        });
      }
      return ListView(
        children: [],
      );
    } else {
      throw Exception();
    }
  }

  @override
  void initState() {
    super.initState();
    getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
                child: TextFormField(
                  // The validator receives the text that the user has entered.
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.white, width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 0.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.white, width: 0.0),
                      ),
                      contentPadding: new EdgeInsets.symmetric(vertical: 0),
                      hintText: 'Kategoriler',
                      hintStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      filled: true,
                      suffixIcon: IconButton(
                        padding: const EdgeInsetsDirectional.only(start: 12.0),
                        alignment: Alignment.centerLeft,
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                        ),
                      )),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Boş Bir Sorgu Aranamaz!';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 3,
            indent: 25,
            endIndent: 55,
          ),
          Column(
            children: [
              Row(children: [
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: 475,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: category.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Row(
                              children: [
                                Card(
                                  elevation: 0,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          90.0),
                                                  side: BorderSide(
                                                      width: 1,
                                                      color: Colors.grey)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.network(
                                                  'https://showmarket-api.herokuapp.com/images/' +
                                                      category[index].img,
                                                  height: 35,
                                                  width: 35,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20, 0, 0, 0),
                                              child: Text(
                                                category[index].name,
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                            IconButton(
                                              splashColor: Colors.red,
                                              splashRadius: 150,
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            HizmetKarsilama(
                                                              categoryId:
                                                                  category[
                                                                          index]
                                                                      .id,
                                                              categoryName:
                                                                  category[
                                                                          index]
                                                                      .name,
                                                              categoryImg:
                                                                  category[
                                                                          index]
                                                                      .img,
                                                            )));
                                              },
                                              icon: Icon(
                                                Icons.arrow_forward_ios,
                                                size: 20,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}

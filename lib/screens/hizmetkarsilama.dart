import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1.dart';
import 'package:showmarket/screens/hizmetdetay.dart';
import 'package:http/http.dart' as http;

class Question {
  String name;
  String category;
  List<String> serviceSector;
  String question;
  String type;
  List<String> answer;
  String id;

  Question(
      {required this.category,
      required this.name,
      required this.question,
      required this.answer,
      required this.serviceSector,
      required this.type,
      required this.id});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['_id'],
      name: json['name'],
      category: json['category'],
      serviceSector: json['serviceSector'],
      question: json['question'],
      answer: json['answer'],
      type: json['type'],
    );
  }
}

final List<Question> questions = [];

class HizmetKarsilama extends StatefulWidget {
  final String categoryId;
  final String categoryName;
  final String categoryImg;
  const HizmetKarsilama(
      {required this.categoryId,
      required this.categoryImg,
      required this.categoryName})
      : super();

  @override
  _HizmetKarsilamaState createState() => _HizmetKarsilamaState();
}

class _HizmetKarsilamaState extends State<HizmetKarsilama> {
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
                OptionsChanges(
                  categoryIdd: widget.categoryId,
                  categoryImg: widget.categoryImg,
                  categoryName: widget.categoryName,
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBottom(),
      ),
    );
  }
}

class OptionsChanges extends StatefulWidget {
  final String categoryIdd;
  final String categoryName;
  final String categoryImg;
  const OptionsChanges(
      {required this.categoryIdd,
      required this.categoryName,
      required this.categoryImg})
      : super();

  @override
  _OptionsChangesState createState() => _OptionsChangesState();
}

class _OptionsChangesState extends State<OptionsChanges> {
  Future<void> getQuestion() async {
    questions.clear();
    print(widget.categoryIdd);
    final response = await http.get(
      Uri.parse(
          'https://showmarket-api.herokuapp.com/api/question/get-by-category/' +
              widget.categoryIdd),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print(response.statusCode);

      var result = jsonDecode(response.body);
      print(result['data']);
      //  print(result['data'][0]['_id']);

      setState(() {
        for (var i = 0; i < result.length; i++) {
          questions.add(Question(
              category: result['data'][i]['category'],
              name: result['data'][i]['name'],
              question: result['data'][i]['question'],
              answer: result['data'][i]['answer'],
              serviceSector: result['data'][i]['serviceSector'],
              type: result['data'][i]['type'],
              id: result['data'][i]['_id']));
        }
      });
    } else {
      throw Exception();
    }
  }

  @override
  void initState() {
    super.initState();
    getQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Text(
                    widget.categoryName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.grey.shade800),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: SizedBox(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://showmarket-api.herokuapp.com/images/' +
                              widget.categoryImg),
                    ),
                  ),
                ),
              ],
            )),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                  child: Text(
                    'Almak İstediğiniz Hizmeti ve Konumu belirleyiniz',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount:questions.length,
              itemBuilder: (BuildContext context, int index) => Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: DropdownSearch<String>(
                      validator: (v) => v == null ? "required field" : null,
                      mode: Mode.MENU,
                      dropdownSearchDecoration: InputDecoration(
                        hoverColor: Colors.white,
                        fillColor: Colors.white,
                        hintText: "Seçilmesi Zorunlu Alan",
                        hintStyle: TextStyle(fontSize: 12),
                        labelText: "Hizmet sektörü seçin.",
                        labelStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                        filled: true,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
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
                          size: 34,
                          color: Colors.black,
                        ),
                      ),
                      showSelectedItems: true,
                      items: ["Sirk", "Parti", "Kapalı Alan", 'Sinema'],
                      showClearButton: true,
                      onChanged: print,
                      popupItemDisabled: (String? s) =>
                          s?.startsWith('I') ?? true,
                    ),
                  ),
                  /* Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            labelText: "Menu mode *",
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF01689A)),
                            ),
                          ),
                        ))*/
                ],
              ),
            ),
          ),
          Divider(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownSearch<String>(
                    validator: (v) => v == null ? "required field" : null,
                    mode: Mode.MENU,
                    dropdownSearchDecoration: InputDecoration(
                      hoverColor: Colors.white,
                      fillColor: Colors.white,
                      hintText: "Seçilmesi Zorunlu Alan",
                      hintStyle: TextStyle(fontSize: 12),
                      labelText: "Hizmet verilecek ili seçin.",
                      labelStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                        size: 34,
                        color: Colors.black,
                      ),
                    ),
                    showSelectedItems: true,
                    items: [
                      "Boya Badana",
                      "Tadilat",
                      "Sıva döşeme",
                      'Duvar Örme'
                    ],
                    showClearButton: true,
                    onChanged: print,
                    popupItemDisabled: (String? s) =>
                        s?.startsWith('I') ?? true,
                  ),
                ),
                /* Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          labelText: "Menu mode *",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF01689A)),
                          ),
                        ),
                      ))*/
              ],
            ),
          ),
          Divider(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownSearch<String>(
                    validator: (v) => v == null ? "required field" : null,
                    mode: Mode.MENU,
                    dropdownSearchDecoration: InputDecoration(
                      hoverColor: Colors.white,
                      fillColor: Colors.white,
                      hintText: "Seçilmesi Zorunlu Alan",
                      hintStyle: TextStyle(fontSize: 12),
                      labelText: "Hizmet verilecek ilçeyi seçin.",
                      labelStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                        size: 34,
                        color: Colors.black,
                      ),
                    ),
                    showSelectedItems: true,
                    items: [
                      "3D Sinema",
                      "Kapalı Alan",
                      "Açık Alan",
                      'Yataklı Sinema'
                    ],
                    showClearButton: true,
                    onChanged: print,
                    popupItemDisabled: (String? s) =>
                        s?.startsWith('I') ?? true,
                  ),
                ),
                /* Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          labelText: "Menu mode *",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF01689A)),
                          ),
                        ),
                      ))*/
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Container(
              width: 310,
              height: 45,
              child: RaisedButton(
                textColor: Colors.black,
                color: Color(0xFFEB3A18),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      color: Color(0xFFEB3A18),
                      width: 5,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(15),
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
                    MaterialPageRoute(builder: (context) => HizmetDetay()),
                  );
                },
                child: const Text('Devam Et'),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

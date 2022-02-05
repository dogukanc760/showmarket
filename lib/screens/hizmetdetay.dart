import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1.dart';
import 'package:showmarket/models/sector.dart';

import 'aktif_hizmet_verenler.dart';
import 'hizmetkarsilama.dart';

class HizmetDetay extends StatefulWidget {
  final List<Question> questions = [];
  final List<Sector> sectors = [];
   HizmetDetay({required questions, required sectors}) : super();

  @override
  _HizmetDetayState createState() => _HizmetDetayState();
}

class _HizmetDetayState extends State<HizmetDetay> {
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
            children: [OptionDetails(questions: widget.questions,)],
          )),
        ),
        bottomNavigationBar: NavigationBottom(),
      ),
    );
  }
}

class OptionDetails extends StatefulWidget {
  final List<Question> questions = [];
   OptionDetails({required questions}) : super();

  @override
  _OptionDetailsState createState() => _OptionDetailsState();
}

class _OptionDetailsState extends State<OptionDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 50),
                  child: Text(
                    'Yataklı Sinema',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: DropdownSearch<String>(
                    validator: (v) => v == null ? "required field" : null,
                    mode: Mode.MENU,
                    dropdownSearchDecoration: InputDecoration(
                      fillColor: Colors.white,
                      hoverColor: Colors.white,
                      hintText: "Seçilmesi Zorunlu Alan",
                      hintStyle: TextStyle(fontSize: 12),
                      labelText: "Film kategorisini seçin",
                      labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold),
                      filled: true,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amberAccent),
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
          SizedBox(
            height: 12,
          ),
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
                      fillColor: Colors.white,
                      hoverColor: Colors.white,
                      hintText: "Seçilmesi Zorunlu Alan",
                      hintStyle: TextStyle(fontSize: 12),
                      labelText: "Vizyondaki filmlerden seçin",
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
          SizedBox(
            height: 12,
          ),
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
                      fillColor: Colors.white,
                      hoverColor: Colors.white,
                      hintText: "Seçilmesi Zorunlu Alan",
                      hintStyle: TextStyle(fontSize: 12),
                      labelText: "Kaç kişi olacağını seçin",
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
          SizedBox(
            height: 12,
          ),
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
                      fillColor: Colors.white,
                      hoverColor: Colors.white,
                      hintText: "Seçilmesi Zorunlu Alan",
                      hintStyle: TextStyle(fontSize: 12),
                      labelText: "Saat seçin",
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
          SizedBox(
            height: 50,
          ),
          Container(
            width: 310,
            height: 45,
            child: RaisedButton(
              textColor: Colors.black,
              color: Color(0xffEB3A18),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Color(0xffEB3A18),
                    width: 5,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(15),
              ),
              onPressed: () {

              },
              child: const Text(
                'Devam Et',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

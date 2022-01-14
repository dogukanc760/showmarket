import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1_Hizmet.dart';
import 'package:showmarket/screens_service_provider/aktif_hizmet_bekleyenler.dart';

class HizmetVeren extends StatefulWidget {
  const HizmetVeren({Key? key}) : super(key: key);

  @override
  _HizmetVerenState createState() => _HizmetVerenState();
}

class _HizmetVerenState extends State<HizmetVeren> {
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
              children: [OptionsChanges()],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBottomHizmet(),
      ),
    );
  }
}

class OptionsChanges extends StatefulWidget {
  const OptionsChanges({Key? key}) : super(key: key);

  @override
  _OptionsChangesState createState() => _OptionsChangesState();
}

class _OptionsChangesState extends State<OptionsChanges> {
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
                    'Sinema',
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
                      image: AssetImage('assets/kategori_1.png'),
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
                    'Vermek İstediğiniz Hizmeti ve Konumu belirleyiniz',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
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
                      labelStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                      labelText: "Hizmet kategorisi seçin.",
                      labelStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      filled: true,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF01689A),
                        ),
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
                    MaterialPageRoute(
                        builder: (context) => AktifHizmetBekleyenler()),
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

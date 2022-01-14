import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:showmarket/screens_service_provider/karsilama_hizmet.dart';

class ProfilTamamla extends StatelessWidget {
  const ProfilTamamla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFEB3A18),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          top: true,
          bottom: true,
          left: true,
          right: true,
          child: SingleChildScrollView(
              child: Stack(
            children: [KayitIcerik()],
          )),
        ),
      ),
    );
  }
}

class KayitIcerik extends StatefulWidget {
  const KayitIcerik({Key? key}) : super(key: key);

  @override
  _KayitIcerikState createState() => _KayitIcerikState();
}

class _KayitIcerikState extends State<KayitIcerik> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
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
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
              child: Text(
                'Müşterilerinizin size ulaşabilmesi için profil bilgilerinizi tamamlayın, daha fazlası'
                ' için profil sayfanızı ziyaret edebilirsiniz.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SizedBox(
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
                          fillColor: Color(0xFFEB3A18),
                          hintText: "Seçilmesi Zorunlu Alan",
                          hintStyle:
                              TextStyle(fontSize: 12, color: Colors.white),
                          labelText: "Hizmet Verdiğim Sektör",
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                          focusColor: Colors.white,
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
                            color: Colors.white,
                          ),
                        ),
                        dropdownButtonBuilder: (_) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 34,
                            color: Colors.white,
                          ),
                        ),
                        showSelectedItems: true,
                        items: ["Sirk", "Sinema", "Açık Alan", 'Kapalı Alan'],
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: SizedBox(
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
                          fillColor: Color(0xFFEB3A18),
                          hintText: "Seçilmesi Zorunlu Alan",
                          hintStyle:
                              TextStyle(fontSize: 12, color: Colors.white),
                          labelText: "Hizmet Kategorisi",
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                          focusColor: Colors.white,
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
                            color: Colors.white,
                          ),
                        ),
                        dropdownButtonBuilder: (_) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 34,
                            color: Colors.white,
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
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: SizedBox(
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
                          fillColor: Color(0xFFEB3A18),
                          hintText: "Seçilmesi Zorunlu Alan",
                          hintStyle:
                              TextStyle(fontSize: 12, color: Colors.white),
                          labelText: "Hizmet Verdiğim İller",
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                          focusColor: Colors.white,
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
                            color: Colors.white,
                          ),
                        ),
                        dropdownButtonBuilder: (_) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 34,
                            color: Colors.white,
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
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: SizedBox(
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
                          fillColor: Color(0xFFEB3A18),
                          hintText: "Seçilmesi Zorunlu Alan",
                          hintStyle:
                              TextStyle(fontSize: 12, color: Colors.white),
                          labelText: "Hizmet Verdiğim İlçeler",
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                          focusColor: Colors.white,
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
                            color: Colors.white,
                          ),
                        ),
                        dropdownButtonBuilder: (_) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 34,
                            color: Colors.white,
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
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.3,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: DropdownSearch<String>(
                        validator: (v) => v == null ? "required field" : null,
                        mode: Mode.MENU,
                        popupBackgroundColor: Colors.white,
                        dropdownSearchDecoration: InputDecoration(
                          hoverColor: Colors.white,
                          fillColor: Color(0xFFEB3A18),
                          hintText: "Seçilmesi Zorunlu Alan",
                          hintStyle:
                              TextStyle(fontSize: 12, color: Colors.white),
                          labelText: "Çalışma Günlerim",
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                          focusColor: Colors.white,
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
                            color: Colors.white,
                          ),
                        ),
                        dropdownButtonBuilder: (_) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 34,
                            color: Colors.white,
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
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: SizedBox(
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
                          fillColor: Color(0xFFEB3A18),
                          hintText: "Seçilmesi Zorunlu Alan",
                          hintStyle:
                              TextStyle(fontSize: 12, color: Colors.white),
                          labelText: "Çalışma Saatlerim",
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                          focusColor: Colors.white,
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
                            color: Colors.white,
                          ),
                        ),
                        dropdownButtonBuilder: (_) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 34,
                            color: Colors.white,
                          ),
                        ),
                        showSelectedItems: true,
                        items: ["Sirk", "Gezi", "Sinema", 'Açık Alan'],
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
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 50),
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
                    child: const Text('Kayıt Ol'),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

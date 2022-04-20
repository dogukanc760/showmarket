import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:showmarket/models/service.dart';
import 'package:showmarket/screens/Favoriler.dart';
import 'package:showmarket/screens/anasayfa.dart';
import 'package:showmarket/screens/hesabim.dart';
import 'package:showmarket/screens/kategoriler.dart';
import 'package:showmarket/screens/taleplerim.dart';

import 'package:http/http.dart' as http;



var searchText = TextEditingController();
var isLoading = false;
List<Service> services=[];
bool _isAvailable = false;
  bool _isListening = false;
   String resultText = "";

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({Key? key}) : super(key: key);

  @override
  _NavigationBottomState createState() => _NavigationBottomState();
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
    title: Text("Kayıt Bulunamadı!"),
    content: Text("Arama içeriğinize göre bir kayıt bulamadık."),
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

class _NavigationBottomState extends State<NavigationBottom> {

 

  int seciliSayfa = 0;
  
   Future<void> getService() async {

    

    final response = await http.get(
      Uri.parse(
          'https://showmarket-api.herokuapp.com/api/service/get-by-name/'+searchText.text),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      services.clear();
      var result = jsonDecode(response.body);
      print(result['data']);
      //  print(result['data'][0]['_id']);
      if (result['data'].length > 0) {
        setState(() {
          for (var i = 0; i < result['data'].length; i++) {
            services.add(Service(
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
                city: result['data'][i]['city'].cast<String>()
            ));
          }
        });
      }
    } else {
      
      throw Exception();
    }
  }
 



  void sayfaDegistir(int index) {
    setState(() {
      seciliSayfa = index;
      print(seciliSayfa);
    });
    sayfaGoster(seciliSayfa);
  }

  sayfaGoster(int seciliSayfa) {
    if (seciliSayfa == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Anasayfa()),
      );
    } else if (seciliSayfa == 1) {
        _displayDialog(context);
    } else if (seciliSayfa == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Taleplerim()),
      );
    } else if (seciliSayfa == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Kategoriler()),
      );
      return Anasayfa();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Hesabim()),
      );
    }
  }
  TextEditingController _textFieldController = TextEditingController();
   
   
  _displayDialog(BuildContext context) async {
    
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color(0xFFEB3A18),
            title: Text('Arama İçeriğinizi Giriniz', style: TextStyle(color: Colors.white),),
            content: TextField(
              controller: searchText,
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(hintText: "Arama İçeriğiniz", hintStyle:TextStyle(color: Colors.white), ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  !isLoading?new FlatButton(
                    child: Row(
                      children: [
                        Icon(Icons.multitrack_audio_outlined, color: Colors.white, size:20),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text('Sesle Ara', style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),//new Text('Ara', style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      setState(() {
                        isLoading=!isLoading;
                      });
                    },
                  ):new FlatButton(
                    child: Row(
                      children: [
                        Icon(Icons.my_library_music_sharp, color: Colors.white, size:20),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text('Dinleniyor...', style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),//new Text('Ara', style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      setState(() {
                        isLoading=!isLoading;
                      });
                      showAlertDialogFailed(context);
                    },
                  ),
                  new FlatButton(
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.white, size:20),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text('Ara', style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),//new Text('Ara', style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      showAlertDialogFailed(context);
                    },
                  ),
                  new FlatButton(
                    child: Row(
                      children: [
                        Icon(Icons.highlight_off, color: Colors.white, size:20),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text('Kapat', style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),//new Text('Ara', style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          );
        });
  }

  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          //opacity: 0.9,
          image: AssetImage('assets/altbar.png'),
          fit: BoxFit.fill,
        ),
      ),
      height: 130,
      width: 0,
      child: Container(
        transform: Matrix4.translationValues(0.0, -40.0, 0.0),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          currentIndex: seciliSayfa,
          onTap: sayfaDegistir,
          type: BottomNavigationBarType.fixed,
          iconSize: 5,
          unselectedItemColor: Colors.black,
          fixedColor: Colors.black,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Container(
                height: 135,
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Color(0xffd0492a),
                    ),
                    color: Color(0xfffee4b1),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(110),
                      bottomRight: Radius.circular(110),
                      bottomLeft: Radius.circular(110),
                      topLeft: Radius.circular(110),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ImageIcon(
                      AssetImage('assets/home.png'),
                      size: 5,
                    ),
                  ),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Container(
                height: 135,
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Color(0xffd0492a),
                    ),
                    color: Color(0xfffee4b1),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(110),
                      bottomRight: Radius.circular(110),
                      bottomLeft: Radius.circular(110),
                      topLeft: Radius.circular(110),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(
                      Icons.search,
                      size: 35,
                    ),
                  ),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 135,
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    color: Color(0xfffebe5e),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ImageIcon(
                      AssetImage('assets/diversity.png'),
                      size: 5,
                    ),
                  ),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Container(
                height: 135,
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Color(0xffd0492a),
                    ),
                    color: Color(0xfffee4b1),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(110),
                      bottomRight: Radius.circular(110),
                      bottomLeft: Radius.circular(110),
                      topLeft: Radius.circular(110),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ImageIcon(
                      AssetImage('assets/basket.png'),
                      size: 5,
                    ),
                  ),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Container(
                height: 136,
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Color(0xffd0492a),
                    ),
                    color: Color(0xfffee4b1),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(110),
                      bottomRight: Radius.circular(110),
                      bottomLeft: Radius.circular(110),
                      topLeft: Radius.circular(110),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: ImageIcon(
                      AssetImage('assets/customer.png'),
                      size: 5,
                    ),
                  ),
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

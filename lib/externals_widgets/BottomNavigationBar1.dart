import 'package:flutter/material.dart';
import 'package:showmarket/screens/Favoriler.dart';
import 'package:showmarket/screens/anasayfa.dart';
import 'package:showmarket/screens/hesabim.dart';
import 'package:showmarket/screens/kategoriler.dart';
import 'package:showmarket/screens/taleplerim.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({Key? key}) : super(key: key);

  @override
  _NavigationBottomState createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int seciliSayfa = 0;
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
              controller: _textFieldController,
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(hintText: "Arama İçeriğiniz", hintStyle:TextStyle(color: Colors.white), ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                      Navigator.of(context).pop();
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
              title: Padding(
                padding: const EdgeInsets.only(top: 7),
              ),
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
              title: Padding(
                padding: const EdgeInsets.only(top: 7),
              ),
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
              title: Padding(
                padding: const EdgeInsets.only(top: 10),
              ),
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
              title: Padding(
                padding: const EdgeInsets.only(top: 7),
              ),
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
                    padding: const EdgeInsets.all(7.0),
                    child: ImageIcon(
                      AssetImage('assets/customer.png'),
                      size: 5,
                    ),
                  ),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

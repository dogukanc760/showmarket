import 'package:flutter/material.dart';
import 'package:showmarket/screens_service_provider/FavorilerHizmet.dart';
import 'package:showmarket/screens_service_provider/anasayfa_hv.dart';
import 'package:showmarket/screens_service_provider/hesabimHizmet.dart';
import 'package:showmarket/screens_service_provider/kategorilerHizmet.dart';
import 'package:showmarket/screens_service_provider/taleplerimHizmet.dart';

class NavigationBottomHizmet extends StatefulWidget {
  const NavigationBottomHizmet({Key? key}) : super(key: key);

  @override
  _NavigationBottomHizmetState createState() => _NavigationBottomHizmetState();
}

class _NavigationBottomHizmetState extends State<NavigationBottomHizmet> {
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
        MaterialPageRoute(builder: (context) => AnasayfaHizmet()),
      );
    } else if (seciliSayfa == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FavorilerHizmet()),
      );
    } else if (seciliSayfa == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TaleplerimHizmet()),
      );
    } else if (seciliSayfa == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => KategorilerHizmet()),
      );
      return AnasayfaHizmet();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HesabimHizmet()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage('assets/altbar.png'),
          fit: BoxFit.fill,
        ),
      ),
      height: 160,
      width: 0,
      child: BottomNavigationBar(
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
                  child: ImageIcon(
                    AssetImage('assets/likes.png'),
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
    );
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1.dart';
import 'package:showmarket/models/demand.dart';
import 'package:showmarket/screens/HizmetVereninProfiliBuradaKullan%C4%B1lcakOlan!/hizmet_verenin_profili.dart';
import 'package:showmarket/screens/talep_durumu.dart';
import 'package:http/http.dart' as http;

final List<Demand> finished = [];
final List<Demand> moving = [];
String userId = "";
int totalCount = 0;

class Taleplerim extends StatelessWidget {
  const Taleplerim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Taleplerim',
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 25,
            ),
          ),
          elevation: 0,
          toolbarHeight: 45,
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorColor: Color(0xFFEB3A18),
            labelColor: Color(0xFFEB3A18),
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Text(
                'Açık Taleplerim',
                style: TextStyle(color: Colors.grey.shade800),
              ),
              Text(
                'Sonlanan Taleplerim',
                style: TextStyle(color: Colors.grey.shade800),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[TalepDurumlarim(), TalepBitenlerim()],
        ),
        bottomNavigationBar: NavigationBottom(),
      ),
    );
  }
}

void getSession() async {
  final prefs = await SharedPreferences.getInstance();
  userId = prefs.getString('id').toString();
  print(userId + "denme");
}

class TalepDurumlarim extends StatefulWidget {
  const TalepDurumlarim({Key? key}) : super(key: key);

  @override
  _TalepDurumlarimState createState() => _TalepDurumlarimState();
}

class _TalepDurumlarimState extends State<TalepDurumlarim> {
  Future<void> getDemands() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('id').toString();
    print(userId + "denme");
    print(userId);
    moving.clear();
    finished.clear();
    print('https://showmarket-api.herokuapp.com/api/demand/get-by-user/' +
        userId);
    final response = await http.get(
      Uri.parse('https://showmarket-api.herokuapp.com/api/demand/get-by-user/' +
          userId),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {

      var result = jsonDecode(response.body);

      //  print(result['data'][0]['_id']);

      for (var i = 0; i < result['data'].length; i++) {
        setState(() {
          if (result['data'][i]['status'] == 'finished' ||
              result['data'][i]['status'] == 'canceled') {
            finished.add(Demand(
                id: result['data'][i]['_id'],
                company: result['data'][i]['company'],
                user: result['data'][i]['user'],
                service: result['data'][i]['service'],
                location: result['data'][i]['location'],
                time: result['data'][i]['time'],
                date: result['data'][i]['date'],
                question: result['data'][i]['question'],
                answer: result['data'][i]['answer'],
                status: result['data'][i]['status'],
                isActive: result['data'][i]['isActive'],
                price: result['data'][i]['price'],
                offerDescription: result['data'][i]['offerDescription'],
                offerPrice: result['data'][i]['offerPrice']));
          } else if (result['data'][i]['status'] == 'moving') {
            moving.add(Demand(
                company: result['data'][i]['company'],
                id: result['data'][i]['_id'],
                user: result['data'][i]['user'],
                service: result['data'][i]['service'],
                location: result['data'][i]['location'],
                time: result['data'][i]['time'],
                date: result['data'][i]['date'],
                question: result['data'][i]['question'],
                answer: result['data'][i]['answer'],
                status: result['data'][i]['status'],
                isActive: result['data'][i]['isActive'],
                price: result['data'][i]['price'],
                offerDescription: result['data'][i]['offerDescription'],
                offerPrice: result['data'][i]['offerPrice']));

          }
        });
      }
    } else {
      throw Exception().toString();
    }
  }

  @override
  void initState() {
    super.initState();
    print("burasi init");
    //WidgetsBinding.instance.addPostFrameCallback((_) {getDemands();});
    getDemands();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.bottom -
                170,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: moving.length,
              itemBuilder: (BuildContext context, int index) => moving.length >
                      0
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                      child: Row(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90.0),
                              side: BorderSide(width: 1, color: Colors.grey),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Image(
                                  image: AssetImage('assets/kategori_1.png'),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 5, 30, 0),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => hvProfil(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          moving[index]
                                              .service[0][2]
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 0, 0),
                                          child: Text(
                                            moving[index]
                                                .service[0][0]
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 60.0, bottom: 10),
                                          child: SizedBox(
                                            width: 150,
                                            height: 35,
                                            child: TextButton(
                                              onPressed: () {

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        TalepDurumu(
                                                            state: 4,
                                                            id: moving[index]
                                                                .id
                                                                .toString()),
                                                  ),
                                                );
                                              },
                                              child:moving[index].offerPrice.isEmpty?
                                                  Text('Teklif Bekleniyor'):
                                              Text(
                                                'Teklif Bekliyor',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xFFEB3A18),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Text(''),
            ),
          ),
        ],
      )),
    );
  }
}

class TalepBitenlerim extends StatefulWidget {
  const TalepBitenlerim({Key? key}) : super(key: key);

  @override
  _TalepBitenlerimState createState() => _TalepBitenlerimState();
}

class _TalepBitenlerimState extends State<TalepBitenlerim> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.bottom -
                170,
            child: finished.length > 1
                ? ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: finished.length,
                    itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                      child: Row(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90.0),
                              side: BorderSide(width: 1, color: Colors.grey),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Image(
                                  image: AssetImage('assets/kategori_1.png'),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 5, 30, 0),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => hvProfil(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          finished[index]
                                              .service[0][2]
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 0, 0),
                                          child: Text(
                                            finished[index]
                                                .service[0][0]
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 60.0, bottom: 10),
                                          child: SizedBox(
                                            width: 150,
                                            height: 35,
                                            child:
                                                finished[index].status ==
                                                        'finished'
                                                    ? TextButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  TalepDurumu(
                                                                      state: 2,
                                                                      id: finished[
                                                                              index]
                                                                          .id),
                                                            ),
                                                          );
                                                        },
                                                        child: Container(
                                                          child: Text(
                                                            "Tamamlandı",
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              color: Color(
                                                                  0xFFEB3A18),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : finished[index].status ==
                                                            'cancelled'
                                                        ? TextButton(
                                                            onPressed: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      TalepDurumu(
                                                                          state:
                                                                              13,
                                                                          id: finished[index]
                                                                              .id),
                                                                ),
                                                              );
                                                            },
                                                            child: Text(
                                                              'İptal Edildi',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                color: Color(
                                                                    0xFFEB3A18),
                                                              ),
                                                            ),
                                                          )
                                                        : TextButton(
                                                            onPressed: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      TalepDurumu(
                                                                          state:
                                                                              2,
                                                                          id: finished[index]
                                                                              .id),
                                                                ),
                                                              );
                                                            },
                                                            child: Text(
                                                              'İptal Edildi',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                color: Color(
                                                                    0xFFEB3A18),
                                                              ),
                                                            ),
                                                          ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Text(''),
          ),
        ],
      ),
    );
  }
}

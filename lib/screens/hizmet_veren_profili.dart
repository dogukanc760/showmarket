import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1.dart';
import 'package:showmarket/models/busines_user.dart';
import 'package:showmarket/models/demand.dart';
import 'package:showmarket/models/demand_set.dart';
import 'package:showmarket/models/service.dart';
import 'package:showmarket/screens/talep_basarili.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class HizmetVerenProfil extends StatelessWidget {
  final String providerId;
  final List<Service> service;
  const HizmetVerenProfil({required this.providerId, required this.service}) : super();

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
                ProfilIcerik(
                  providerId: providerId,
                  service:service
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

List<User> user = [];
List<Demand> demand =[];
String userId = '';

class ProfilIcerik extends StatefulWidget {
  final List<Service> service;
  final String providerId;
  const ProfilIcerik({required this.providerId, required this.service}) : super();

  @override
  _ProfilIcerikState createState() => _ProfilIcerikState();
}

class _ProfilIcerikState extends State<ProfilIcerik> {
  _makingPhoneCall() async {
    const url = '';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> getUser() async {
    user.clear();

    final response = await http.get(
      Uri.parse('https://showmarket-api.herokuapp.com/api/user/find/' +
          widget.providerId),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print(response.statusCode);

      var result = jsonDecode(response.body);
      print(result);
      //  print(result['data'][0]['_id']);

        setState(() {
          user.add(User(
              comments: result['comments'].cast<String>(),
              about: result['about'],
              gsm: result['gsm'],
              name: result['name'],
              mail: result['mail'],
              username: result['mail'],
              password: result['password']),);
          print(user[0]);
        });

    } else {
      throw Exception();
    }
  }
  List<String> servicess = [];
  List<String> location = [];
  List<String> questions = [];
  List<String> answers = [];
  List<DemandSet> demands = [];


  Future<void> setDemand() async {
    user.clear();
    bool isActive = true;
    final prefs = await SharedPreferences.getInstance();
    var now = DateTime.now();
    DemandSet demandSet = new DemandSet(
        company: widget.providerId.toString(), user: prefs.getString('id').toString(),
        service: [widget.service[0].sector,widget.providerId, widget.service[0].companyName,
          widget.service[0].title], location: [widget.service[0].city, widget.service[0].distinct],
        time: 'time', date: 'date', question: widget.service[0].questions, answer: widget.service[0].answer, status: 'moving',
        price: 'price', offerDescription: 'offerDescription', offerPrice: 'offerPrice');
    //demands.add(DemandSet(company: widget.providerId.toString(), user: prefs.getString('id').toString(),
      //  service: [widget.service[0].sector,widget.providerId, widget.service[0].companyName,
        //  widget.service[0].title], location: [widget.service[0].city, widget.service[0].distinct],
        //time: 'time', date: 'date', question: widget.service[0].questions, answer: widget.service[0].answer, status: 'moving',
         //price: 'price', offerDescription: 'offerDescription', offerPrice: 'offerPrice'));
    //var bytes = utf8.encode(json.encode(data));
      var bytes = jsonEncode(demandSet.toJson());
    final response = await http.post(
      Uri.parse('https://showmarket-api.herokuapp.com/api/demand/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: bytes,
    );

    if (response.statusCode == 200) {
      print(response.statusCode);

      var result = jsonDecode(response.body);
      print(result);
      //  print(result['data'][0]['_id']);



    } else {
      throw Exception();
    }
  }

  @override
  void initState() {
    print(widget.providerId);
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              'İşletme Profili',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEB3A18),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 250.0),
                child: Text(
                  user[0].name,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 270.0, top: 5, bottom: 5),
                child: Text(
                  'Salon Adı',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
          Column(
            children: [
              Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Container(
                            width: 350,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                image: AssetImage("assets/sinemaArkaplan.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Text(
                                    '5.0',
                                    style: TextStyle(
                                        color: Color(0xFFEB3A18),
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 25.0),
                                  child: RatingBar.builder(
                                    initialRating: 5,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 17,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 2.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      size: 2,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "0 Yorum ",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFFEB3A18),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
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
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 15, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                      child: Text('Yorumlar',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 269.0),
                              child: Text(
                                'Kullanıcı Adı',
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                                user[0].comments.toString(),
                                 style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text('Hakkında',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Text(
                            'Hakkında',style: TextStyle(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 10)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 220,
                        child: RaisedButton(
                          textColor: Colors.black,
                          color: Color(0xFFEB3A18),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Color(0xFFEB3A18),
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          onPressed: () {
                            //setDemand();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TalepBasarili()),
                            );

                          },
                          child: const Text(
                            'Teklif İste',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

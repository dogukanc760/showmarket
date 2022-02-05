import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1.dart';
import 'package:showmarket/models/sector.dart';
import 'package:showmarket/models/service.dart';
import 'package:showmarket/screens/hizmet_veren_profili.dart';
import 'package:http/http.dart' as http;

import 'hizmetkarsilama.dart';

List<Service> services=[];

class AktifHizmetVerenler extends StatefulWidget {
  final List<Question> questions;
  final List<Sector> sectors ;
  List<String> selectedQuestion;
  String sector;
  String city ;
  String distinct;
  String category;
  AktifHizmetVerenler({required this.category,required this.selectedQuestion,required this.questions,required this.sectors,
  required this.sector, required this.city, required this.distinct}) : super();

  @override
  State<AktifHizmetVerenler> createState() => _AktifHizmetVerenlerState();
}

class _AktifHizmetVerenlerState extends State<AktifHizmetVerenler> {
  Future<void> getService() async {

    widget.questions.clear();

    final response = await http.get(
      Uri.parse(
          'https://showmarket-api.herokuapp.com/api/service/get-by-demand/' +widget.sector
              +'/'+ widget.category+'/'+widget.city+'/'+widget.distinct),
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
          for (var i = 0; i < result.length - 1; i++) {
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
  @override
  void initState() {
    getService();
    super.initState();
  }
  @override
  final ScrollController _controller = ScrollController();

  var index;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          title: Text(
            'Şu an aktif olan hizmetler',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.grey.shade700),
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: Scrollbar(
          controller: _controller,
          isAlwaysShown: true,
          child: Container(
            child: Container(
              child: GridView.builder(
                padding: EdgeInsets.all(25),
                controller: _controller,
                itemCount: services.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                itemBuilder: (BuildContext context, int sayi) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage('assets/sinemaArkaplan.jpg'),
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child:  Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 80.0),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.favorite,
                                          size: 20,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 100.0, left: 30),
                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.tealAccent,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Text(
                                      'İndirim',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 161,
                                    height: 20,
                                    child: RatingBar.builder(
                                      initialRating: 5,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 18,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 7),
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
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0, right: 80),
                                    child: Container(
                                      child: Text(
                                        services[sayi].companyName,
                                        style:
                                        TextStyle(color: Colors.blueAccent, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0, right: 85),
                                    child: Container(
                                      child: Text(
                                        services[sayi].title,
                                        style: TextStyle(
                                            color: Colors.indigo,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0, left: 120),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(90),
                                          border: Border.all(color: Colors.black)),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => HizmetVerenProfil(providerId: services[sayi].user, service: services,),
                                            ),
                                          );
                                        },
                                        icon: Container(
                                          child: Image(
                                            image: AssetImage('assets/basket.png'),
                                          ),
                                        ),
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        bottomNavigationBar: NavigationBottom(),
      ),
    );
  }
}



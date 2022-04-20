import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1.dart';
import 'package:http/http.dart' as http;
import 'package:showmarket/models/service.dart';

List<Service> serviceList = [];
class ServiceDetail extends StatefulWidget {
  String serviceId;
   ServiceDetail({required this.serviceId}) : super();

  @override
  _ServiceDetailState createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail> {
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
              children: [Content(serviceId: widget.serviceId,)],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBottom(),
      ),
    );
  }
}


class Content extends StatefulWidget {
  String serviceId;
  Content({required this.serviceId}) : super();

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  Future<void> getService() async {


    final response = await http.get(
      Uri.parse(
          'https://showmarket-api.herokuapp.com/api/service/'+widget.serviceId),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      serviceList.clear();
      var result = jsonDecode(response.body);
      print(result['data']);
      //  print(result['data'][0]['_id']);
      if (result['data'].length > 0) {
        setState(() {
          for (var i = 0; i < result.length - 1; i++) {
            serviceList.add(Service(
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
                city: result['data'][i]['city'].cast<String>()));
          }
        });
      }
    } else {
      throw Exception();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getService();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


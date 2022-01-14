import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1_Hizmet.dart';

final List<String> imgList = [
  'assets/anasayfaslider.jpg',
  'assets/anasayfaslider.jpg',
  'assets/anasayfaslider.jpg',
  'assets/anasayfaslider.jpg'
];

final List<String> categoryList = [
  '',
  'Geziler',
  'Sinema',
  'Kapalı Alan',
  'Etkinlik',
  'Etkinlik',
  'Etkinlik',
  'Etkinlik',
  'Etkinlik',
  'Etkinlik',
  'Etkinlik'
];

final List<String> fastService = [
  'Geziler',
  'Sinema',
  'Kapalı Alan',
  'Açık Alan',
  'Etkinlik-1',
  'Etkinlik-1',
  'Etkinlik-1',
  'Etkinlik-1',
  'Etkinlik-1',
  'Etkinlik-1',
  'Etkinlik-1'
];

class AnasayfaHizmet extends StatefulWidget {
  const AnasayfaHizmet({Key? key}) : super(key: key);

  @override
  State<AnasayfaHizmet> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<AnasayfaHizmet> {
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
              children: [HomePages()],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBottomHizmet(),
      ),
    );
  }
}

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Container(
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.grey, Colors.white70],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 0.6],
                    tileMode: TileMode.clamp,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white70,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide:
                          BorderSide(color: Colors.grey.shade300, width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide:
                          BorderSide(color: Colors.greenAccent, width: 0.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                    ),
                    contentPadding: new EdgeInsets.symmetric(vertical: 0),
                    hintText: 'Aradığınız hizmeti belirtiniz.',
                    hintStyle:
                        TextStyle(color: Colors.grey.shade500, fontSize: 14),
                    filled: true,
                    prefixIcon: IconButton(
                      padding: const EdgeInsetsDirectional.only(start: 12.0),
                      alignment: Alignment.centerLeft,
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Boş Bir Sorgu Aranamaz!';
                    }
                    return null;
                  },
                ),
              ),
            )
          ]),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 76,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            color: Color(0xFFEB3A18),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Container(
                  width: 80,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.fill,
                      image: AssetImage('assets/logo.png'),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                    child: Text(
                      'Show Market',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 220,
                    height: 30,
                    padding: EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.white, fontSize: 16),
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                                ),
                              ),
                              TextSpan(text: 'Gösteri Dünyası Özgür Erişim ')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              color: Colors.grey,
              width: MediaQuery.of(context).size.width,
              height: 190,
              child: Row(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ImageSliderDemo_2()),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 35,
          color: Colors.white10,
          child: TextButton(
            onPressed: () {},
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Daha fazlasını Keşfet",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  WidgetSpan(
                    child: Icon(Icons.keyboard_arrow_right,
                        size: 17, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 76,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            color: Color(0xFFEB3A18),
          ),
          child: Row(children: [
            Expanded(
              child: Center(
                child: Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      SizedBox(width: 12),
                      Column(
                        children: [
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5, left: 10),
                              child: Container(
                                height: 53,
                                width: 53,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                      bottomRight: Radius.circular(40.0),
                                      topLeft: Radius.circular(40.0)),
                                  color: Color(0xffe3edf6),
                                  image: DecorationImage(
                                    image: AssetImage('assets/ikon1.png'),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              print("tapped on container");
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, left: 12),
                            child: Text('Sinema',
                                style: TextStyle(
                                    fontSize: 11, color: Colors.white)),
                          )
                        ],
                      ),
                      SizedBox(width: 17),
                      Column(
                        children: [
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                height: 53,
                                width: 53,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                      bottomRight: Radius.circular(40.0),
                                      topLeft: Radius.circular(40.0)),
                                  color: Color(0xFFffeea4),
                                  image: DecorationImage(
                                    image: AssetImage('assets/ikon2.png'),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              print("tapped on container");
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text('Tiyatro',
                                style: TextStyle(
                                    fontSize: 11, color: Colors.white)),
                          )
                        ],
                      ),
                      SizedBox(width: 17),
                      Column(
                        children: [
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                height: 53,
                                width: 53,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                      bottomRight: Radius.circular(40.0),
                                      topLeft: Radius.circular(40.0)),
                                  color: Color(0xFFd4ff86),
                                  image: DecorationImage(
                                    image: AssetImage('assets/ikon3.png'),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              print("tapped on container");
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text('Sirk',
                                style: TextStyle(
                                    fontSize: 11, color: Colors.white)),
                          )
                        ],
                      ),
                      SizedBox(width: 17),
                      Column(
                        children: [
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                height: 53,
                                width: 53,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                      bottomRight: Radius.circular(40.0),
                                      topLeft: Radius.circular(40.0)),
                                  color: Color(0xFFf6baba),
                                  image: DecorationImage(
                                    image: AssetImage('assets/ikon4.png'),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              print("tapped on container");
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text('Dans',
                                style: TextStyle(
                                    fontSize: 11, color: Colors.white)),
                          )
                        ],
                      ),
                      SizedBox(width: 17),
                      Column(
                        children: [
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                height: 53,
                                width: 53,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                      bottomRight: Radius.circular(40.0),
                                      topLeft: Radius.circular(40.0)),
                                  color: Color(0xFfdddfde),
                                  image: DecorationImage(
                                    image: AssetImage('assets/ikon5.png'),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              print("tapped on container");
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text('Müzik',
                                style: TextStyle(
                                    fontSize: 11, color: Colors.white)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ), //------------- BURAYA KADAR

        Container(
          width: MediaQuery.of(context).size.width,
          height: 160,
          color: Colors.grey.shade200,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 2),
                    child: Text(
                      'Toplu Etkinlikler',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 110,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) => Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: Image.asset(
                                          'assets/toplu${index + 1}.png',
                                          height: 50,
                                          width: 50,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      child: Text(
                                        '${fastService[index]}',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 10, 0, 10),
                  child: Text(
                    'Trend Etkinlikler',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      color: Colors.grey,
                      width: MediaQuery.of(context).size.width,
                      height: 190,
                      child: Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              child: ImageSliderDemo_2()),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 190,
          color: Colors.grey.shade200,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 2),
                    child: Text(
                      'Benzer Etkinlikler',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 110,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) => Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: Image.asset(
                                          'assets/toplu${index + 1}.png',
                                          height: 50,
                                          width: 50,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      child: Text(
                                        '${fastService[index]}',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}

class ImageSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
          ),
          items: imgList
              .map((item) => Container(
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.grey, Colors.white70],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.1, 0.6],
                        tileMode: TileMode.clamp,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                    child: Center(
                        child:
                            Image.asset(item, fit: BoxFit.fill, width: 1000)),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class ImageSliderDemo_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 2.0,
        ),
        items: imgList
            .map(
              (item) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 0.004,
                      blurRadius: 10,
                      offset: Offset(0, 9), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Image.asset(item, fit: BoxFit.fill, width: 1000),
                      ),
                      Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Text(
                          'Her Perşembe Saat 10:00`da!',
                          style: TextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      )),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Text(''),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

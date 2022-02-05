import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1.dart';

class Favoriler extends StatefulWidget {
  const Favoriler({Key? key}) : super(key: key);

  @override
  _FavorilerState createState() => _FavorilerState();
}

class _FavorilerState extends State<Favoriler> {
  @override
  final ScrollController _controller = ScrollController();
  var index;
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Colors.white,
          backgroundColor: Color(0xFFEB3A18),
          title: Text(
            'Favoriler',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
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
                itemCount: 5,
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
                    child: Sayfalar(),
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

class Sayfalar extends StatefulWidget {
  const Sayfalar({Key? key}) : super(key: key);

  @override
  _SayfalarState createState() => _SayfalarState();
}

class _SayfalarState extends State<Sayfalar> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                        'İşletme Adı',
                        style:
                        TextStyle(color: Colors.blueAccent, fontSize: 12),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0, right: 85),
                    child: Container(
                      child: Text(
                        'Salon Adı',
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
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}


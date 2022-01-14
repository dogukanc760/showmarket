import 'package:flutter/material.dart';

import 'girissayfasi.dart';

class Karsilama2 extends StatelessWidget {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final _controller = new PageController();
    const _kDuration = const Duration(milliseconds: 300);
    const _kCurve = Curves.ease;
    return Scaffold(
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SafeArea(
          top: true,
          bottom: true,
          left: true,
          right: true,
          child: PageView.builder(
            controller: _controller,
            itemBuilder: (context, index) {
              return Container(
                height: 0,
                color: Colors.white,
                child: IntrinsicWidth(
                  child: SingleChildScrollView(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            child: Image(
                              image:
                                  AssetImage('assets/tanitim${index + 1}.png'),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: 3,
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(
            child: Icon(Icons.navigate_next),
            backgroundColor: Color(0xFFEB3A18),
            onPressed: () {
              _controller.page == 2
                  ? Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => GirisSayfasi()),
                    )
                  : _controller.nextPage(duration: _kDuration, curve: _kCurve);
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
    throw UnimplementedError();
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:showmarket/externals_widgets/BottomNavigationBar1_Hizmet.dart';
import 'package:showmarket/screens_service_provider/anasayfa_hv.dart';

class HizmetFotograf extends StatefulWidget {
  const HizmetFotograf({Key? key}) : super(key: key);

  @override
  _HizmetFotografState createState() => _HizmetFotografState();
}

class _HizmetFotografState extends State<HizmetFotograf> {
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
              children: [FotografEkleme()],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBottomHizmet(),
      ),
    );
  }
}

class FotografEkleme extends StatefulWidget {
  const FotografEkleme({Key? key}) : super(key: key);

  @override
  _FotografEklemeState createState() => _FotografEklemeState();
}

class _FotografEklemeState extends State<FotografEkleme> {
  var imageFile;
  var imageFile2;
  var imageFile3;
  var imageFile4;
  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _getFromGallery2() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile2 = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera2() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile2 = File(pickedFile.path);
      });
    }
  }

  _getFromGallery3() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile3 = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera3() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile3 = File(pickedFile.path);
      });
    }
  }

  _getFromGallery4() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile4 = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera4() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile4 = File(pickedFile.path);
      });
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Galeri'),
                      onTap: () {
                        _getFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Kamera'),
                    onTap: () {
                      _getFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showPicker2(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Galeri'),
                      onTap: () {
                        _getFromGallery2();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Kamera'),
                    onTap: () {
                      _getFromCamera2();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showPicker3(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Galeri'),
                      onTap: () {
                        _getFromGallery3();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Kamera'),
                    onTap: () {
                      _getFromCamera3();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showPicker4(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Galeri'),
                      onTap: () {
                        _getFromGallery4();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Kamera'),
                    onTap: () {
                      _getFromCamera4();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: Text(
                    '       Müşterileriniz referanslarınızı \n görmek istiyor. İşi tamamladığınızda \n       en az 1 fotoğraf çekmelisiniz.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    '(Farklı açılardan max. 4 adet)',
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(width: 2.3, color: Colors.grey)),
                    child: FlatButton(
                      onPressed: () {
                        _showPicker(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: imageFile == null
                            ? Image.asset(
                                'assets/imageIcon.png',
                                height: 150,
                                width: 120,
                                fit: BoxFit.fill,
                              )
                            : Image.file(
                                imageFile,
                                height: 120,
                                width: 150,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(width: 2.3, color: Colors.grey)),
                    child: FlatButton(
                      onPressed: () {
                        _showPicker2(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: imageFile2 == null
                            ? Image.asset(
                                'assets/imageIcon.png',
                                height: 150,
                                width: 120,
                                fit: BoxFit.fill,
                              )
                            : Image.file(
                                imageFile,
                                height: 120,
                                width: 150,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(width: 2.3, color: Colors.grey)),
                    child: FlatButton(
                      onPressed: () {
                        _showPicker3(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: imageFile3 == null
                            ? Image.asset(
                                'assets/imageIcon.png',
                                height: 150,
                                width: 120,
                                fit: BoxFit.fill,
                              )
                            : Image.file(
                                imageFile,
                                height: 120,
                                width: 150,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(width: 2.3, color: Colors.grey)),
                    child: FlatButton(
                      onPressed: () {
                        _showPicker4(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: imageFile4 == null
                            ? Image.asset(
                                'assets/imageIcon.png',
                                height: 150,
                                width: 120,
                                fit: BoxFit.fill,
                              )
                            : Image.file(
                                imageFile,
                                height: 120,
                                width: 150,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: RaisedButton(
              textColor: Colors.black,
              color: Color(0xFFEB3A18),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Color(0xFFEB3A18),
                    width: 5,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(15),
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AnasayfaHizmet()));
              },
              child: const Text(
                'Devam Et',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}

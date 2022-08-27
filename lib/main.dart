import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:untitledfolder/prodact.dart';
//import 'package:flutter_barcode_scanner_example/prodact.dart';

import 'api/getdata.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var respose;
  String _scanBarcode = 'لاتوجد نتيجة بعد';
  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
      setState(() {
        _scanBarcode = barcodeScanRes;
      });
      Getdata getdata = new Getdata();
      var data = {
        'barcoenumber' : barcodeScanRes,

      };
       respose = getdata.postData(data , '/getdata');
      print(respose);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Prodact(value : barcodeScanRes),
        settings:  RouteSettings(
          arguments:  barcodeScanRes,
        ),

      ));
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;


  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal( BuildContext context) async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.BARCODE);

      print(barcodeScanRes);
      Getdata getdata = new Getdata();
      var data = {
        'barcoenumber' : barcodeScanRes,

      };

      try {
         respose= await getdata.postData(data , 'getdata');
        if (respose['success']) {
          print(respose['message']);
          print(respose['prodactname']);
          Navigator.push(context, MaterialPageRoute(builder: (context) => Prodact(value : respose)));
        }else if (! respose['success']){
          print(respose['message']);
        }
      }catch(e){
        print(e);
      }



      setState(() {
        _scanBarcode = barcodeScanRes;
      });

    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    // setState(() {
    //   _scanBarcode = barcodeScanRes;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(title: const Text('Barcode scan'),
            backgroundColor: Colors.amber,
            ),
            body: Builder(builder: (BuildContext context) {
              return SingleChildScrollView(
                child:  Container(
                    alignment: Alignment.center,
                    child: Flex(
                        direction: Axis.vertical,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(bottom: 80),
                            child:Image(
                                height: 160,
                                width: 160,
                                image: AssetImage('images/barcode.png')),

                          ),
                          Padding(padding: EdgeInsets.all(40),
                            child:ElevatedButton(
                                onPressed: () {
                                  scanBarcodeNormal( context);
                                },
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(EdgeInsets.only(top: 20 , right: 80 , left: 80, bottom: 20)),
                                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                                ),
                                child: Text('مسح رمز المنتج')),),
                          Text(' قم بمسح الباكود للحصول علي نتيجة $_scanBarcode\n',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ])),
              );
            })));
  }
}

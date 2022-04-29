import 'package:flutter/material.dart';
import 'package:foodie_ui_kit/data/variables.dart';
import 'package:foodie_ui_kit/theme/colors.dart';
import 'package:foodie_ui_kit/theme/helper.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

class GeneratePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeneratePageState();
}

class GeneratePageState extends State<GeneratePage> {
  String qrData = promptpay(
      ownerphone, amount); // already generated qr code when the page opens

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text('QR Code Generator'),
        actions: <Widget>[],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QrImage(
              //plce where the QR Image will be shown
              data: qrData,
            ),
            SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: FlatButton(
                padding: EdgeInsets.all(15.0),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "ยืนยันการโอน",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            )
          ],
        ),
      ),
    );
  }

  final qrdataFeed = TextEditingController();
}

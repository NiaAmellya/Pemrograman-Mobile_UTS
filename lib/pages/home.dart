import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uts/pages/custome1.dart';
import 'package:uts/pages/recommendation1.dart';
//import

class HomeFloral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Parfume'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 50,
              width: 250,
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color.fromRGBO(0, 0, 0, 1))),
                child: Column(
                  children: [
                    Text("Recommendation",
                        style: TextStyle(
                            fontSize: 27, color: Color.fromRGBO(0, 0, 0, 1))),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Recommendation1()),
                  );
                },
              ),
            ),
            Container(
              height: 50,
              width: 250,
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color.fromRGBO(0, 0, 0, 1))),
                child: Column(
                  children: [
                    Text("Custome",
                        style: TextStyle(
                            fontSize: 27, color: Color.fromRGBO(0, 0, 0, 1))),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Custome1()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

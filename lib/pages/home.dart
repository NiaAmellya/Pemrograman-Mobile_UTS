import 'package:flutter/material.dart';
import 'package:uts/models/item.dart';

class HomePage extends StatelessWidget {
  final List<ItemHome> items = [
    ItemHome(
      aroma: 'Powdery',
    ),
    ItemHome(
      aroma: 'Floral',
    ),
    ItemHome(
      aroma: 'Fruity',
    ),
    ItemHome(
      aroma: 'Woody',
    ),
    ItemHome(
      aroma: 'Sweet',
    ),
    ItemHome(
      aroma: 'Musk',
    ),
    ItemHome(
      aroma: 'Oceanic',
    ),
    ItemHome(
      aroma: 'Green',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: Text("Customel Parfum"),
      ),
      body: Container(
          margin: EdgeInsets.all(8),
          child: GridView.builder(
              padding: EdgeInsets.all(8),
              itemCount: items.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                final item = items[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/home', arguments: item);
                  },
                  child: Card(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Expanded(child: Text(item.aroma)),

                          //Expanded(
                          //child: Text(
                          //item.stok.toString(),
                          //textAlign: TextAlign.end,
                          //),
                          //)
                        ],
                      ),
                    ),
                  ),
                );
              })), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

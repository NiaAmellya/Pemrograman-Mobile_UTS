import 'package:flutter/material.dart';
import 'package:uts/models/item.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
      aroma: 'Powdery',
    ),
    Item(
      aroma: 'Floral',
    ),
    Item(
      aroma: 'Fruity',
    ),
    Item(
      aroma: 'Woody',
    ),
    Item(
      aroma: 'Sweet',
    ),
    Item(
      aroma: 'Musk',
    ),
    Item(
      aroma: 'Oceanic',
    ),
    Item(
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
                    Navigator.pushNamed(context, '/item', arguments: item);
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

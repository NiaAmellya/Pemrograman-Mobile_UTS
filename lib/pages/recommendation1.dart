import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uts/models/dbhelper.dart';
import 'package:uts/models/item_referensi.dart';
import 'package:uts/pages/entryformrecom1.dart';
import 'dart:async';

class Recommendation1 extends StatefulWidget {
  @override
  Recommendation1State createState() => Recommendation1State();
}

class Recommendation1State extends State<Recommendation1> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Item> itemList;
  String _jenis;
  List _listJenis = ["Eau De Parfum", "Eau De Cologne", "Eau De Toilette"];

  // void dropdownOnChanged(String changeValue) {
  //   setState(() {
  //     _newValue = changeValue;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    updateListView();
  }

  @override
  Widget build(BuildContext context) {
    if (itemList == null) {
      itemList = List<Item>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommendation Parfume'),
      ),
      body: Column(children: [
        Expanded(
          child: createListView(),
        ),
        //button untuk menambah item pada recommendation
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                RaisedButton(
                  child: Text("Tambah Item Recommendation"),
                  onPressed: () async {
                    var item = await navigateToEntryForm(context, null);
                    if (item != null) {
                      //TODO 2 Panggil Fungsi untuk Insert ke DB
                      int result = await dbHelper.insertItem(item);
                      if (result > 0) {
                        updateListView();
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Future<Item> navigateToEntryForm(BuildContext context, Item item) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryFormRecom1(item);
    }));
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.ad_units),
            ),
            title: Text(
              this.itemList[index].merk,
              style: textStyle,
            ),
            //mencetak hasil pengisian form
            subtitle:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Kode   : ' + this.itemList[index].kode.toString()),
              Text('Jenis  : ' + this.itemList[index].jenis.toString()),
              Text('Merk   : ' + this.itemList[index].merk.toString()),
              Text('Stok   : ' + this.itemList[index].stok.toString()),
              Text('Harga  : Rp ' + this.itemList[index].harga.toString()),
            ]),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                //TODO 3 Panggil Fungsi untuk Delete dari DB berdasarkan Item
                int id = this.itemList[index].id; // get id from sqlite database
                await dbHelper.deleteItem(id); // delete by id from table
                itemList.removeAt(index); // delete by index from list
                updateListView();
              },
            ),
            onTap: () async {
              var item =
                  await navigateToEntryForm(context, this.itemList[index]);
              //TODO 4 Panggil Fungsi untuk Edit data
              if (item != null) {
                int result = await dbHelper.updateItem(item);
                if (result > 0) {
                  updateListView();
                }
              }
            },
          ),
        );
      },
    );
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      //TODO 1 Select data dari DB
      Future<List<Item>> itemListFuture = dbHelper.getItemListItem();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }
}

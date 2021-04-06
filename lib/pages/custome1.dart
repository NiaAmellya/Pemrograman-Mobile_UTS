import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uts/models/dbhelper.dart';
import 'package:uts/models/item_custome.dart';
import 'package:uts/pages/entryformcus1.dart';
import 'package:uts/pages/entryformrecom1.dart';
import 'dart:async';

class Custome1 extends StatefulWidget {
  @override
  Custome1State createState() => Custome1State();
}

class Custome1State extends State<Custome1> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Custom> itemList;
  @override
  void initState() {
    super.initState();
    updateListView();
  }

  @override
  Widget build(BuildContext context) {
    if (itemList == null) {
      itemList = List<Custom>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Custome Parfume'),
      ),
      body: Column(children: [
        Expanded(
          child: createListView(),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                RaisedButton(
                  child: Text("Tambah Item Custom"),
                  onPressed: () async {
                    var item = await navigateToEntryForm(context, null);
                    if (item != null) {
                      //TODO 2 Panggil Fungsi untuk Insert ke DB
                      int result = await dbHelper.insertCustom(item);
                      if (result > 0) {
                        updateListView();
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Future<Custom> navigateToEntryForm(
      BuildContext context, Custom custom) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryFormCus1(custom);
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
          margin: EdgeInsets.all(8),
          child: ListTile(
            leading: Column(
              children: [
                Text('CUST ID'),
                Text(
                  this.itemList[index].id.toString(),
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            title: Text(
              this.itemList[index].pemesan,
              style: textStyle,
            ),
            subtitle:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Bahan 1     : ' + this.itemList[index].bahan1.toString()),
              Text('Ukuran 1    : ' +
                  this.itemList[index].ukuran1.toString() +
                  ' ml'),
              Text('Bahan 2     : ' + this.itemList[index].bahan2.toString()),
              Text('Ukuran 2    : ' +
                  this.itemList[index].ukuran2.toString() +
                  ' ml'),
            ]),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                //TODO 3 Panggil Fungsi untuk Delete dari DB berdasarkan Item
                int id = this.itemList[index].id; // get id from sqlite database
                await dbHelper.deleteCustom(id); // delete by id from table
                itemList.removeAt(index); // delete by index from list
                updateListView();
              },
            ),
            onTap: () async {
              var item =
                  await navigateToEntryForm(context, this.itemList[index]);
              //TODO 4 Panggil Fungsi untuk Edit data
              if (item != null) {
                int result = await dbHelper.updateCustom(item);
                if (result > 0) {
                  updateListView();
                }
              }
              //TODO 4 Panggil Fungsi untuk Edit data
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
      Future<List<Custom>> itemListFuture = dbHelper.getItemListCustom();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }
}

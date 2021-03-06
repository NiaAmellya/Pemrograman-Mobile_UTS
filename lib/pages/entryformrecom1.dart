import 'package:flutter/material.dart';
import 'package:uts/models/dbhelper.dart';
import 'package:uts/models/item_referensi.dart';

class EntryFormRecom1 extends StatefulWidget {
  final Item item;
  EntryFormRecom1(this.item);
  @override
  EntryFormRecom1State createState() => EntryFormRecom1State(this.item);
}

//class controller
class EntryFormRecom1State extends State<EntryFormRecom1> {
  var itemList = ["Eau De Parfum", "Eau De Cologne", "Eau De Toilette"];
  Item item;
  Item jns;
  String _newValue = "Eau De Parfum";
  List<String> listViewItem = List<String>();
  EntryFormRecom1State(this.item);
  TextEditingController kodeController = TextEditingController();
  TextEditingController jenisController = TextEditingController();
  TextEditingController merkController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  TextEditingController hargaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //kondisi
    if (item != null) {
      kodeController.text = item.kode.toString();
      jenisController.text = item.jenis;
      merkController.text = item.merk;
      stokController.text = item.stok.toString();
      hargaController.text = item.harga.toString();
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          title: item == null ? Text('Tambah') : Text('Ubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              // nama
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: kodeController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Kode',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: DropdownButton<String>(
                  items: itemList.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  value: _newValue,
                  onChanged: (String value) {
                    setState(() {
                      _newValue = value;
                    });
                  },
                  //decoration: InputDecoration(
                  //border: OutlineInputBorder(
                  //  borderRadius: BorderRadius.circular(5.0),
                  //   ),
                  // ),
                ),
              ),
              // harga
              //
              // Padding(
              //   padding: EdgeInsets.all(16.0), //(top: 20.0, bottom: 20.0),
              //   child: DropdownButton<String>(
              //     value: _jenis,
              //     onChanged: (String value) {
              //       setState(() {
              //         _jenis = value;
              //       });
              //     },
              //     items: <String>[
              //       "Eau De Parfum",
              //       "Eau De Cologne",
              //       "Eau De Toilette"
              //     ].map<DropdownMenuItem<String>>((String value) {
              //       return DropdownMenuItem<String>(
              //         value: value,
              //         child: Text(value),
              //       );
              //     }).toList(),
              //   ),
              //   padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              //   child: TextField(
              //     controller: jenisController,
              //     keyboardType: TextInputType.text,
              //     decoration: InputDecoration(
              //       labelText: 'Jenis',
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(5.0),
              //       ),
              //     ),
              //     onChanged: (value) {
              //       //
              //     },
              //   ),

              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: merkController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Merk',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: stokController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Stok',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: hargaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Harga',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // tombol button
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    // tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (item == null) {
                            // tambah data
                            item = Item(
                                int.parse(kodeController.text),
                                //_listJenis.,
                                _newValue,
                                merkController.text,
                                int.parse(stokController.text),
                                int.parse(hargaController.text));
                          } else {
                            // ubah data
                            item.kode = int.parse(kodeController.text);
                            //item.value = _listJenis.map;
                            item.jenis = _newValue;
                            item.merk = merkController.text;
                            item.stok = int.parse(stokController.text);
                            item.harga = int.parse(hargaController.text);
                          }
                          // kembali ke layar sebelumnya dengan membawa objek item
                          Navigator.pop(
                            context,
                            item,
                          );
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(
                              context); //untuk meromove layar dari tumpukan
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:uts/models/item_custome.dart';

class EntryFormCus1 extends StatefulWidget {
  final Custom custom;
  EntryFormCus1(this.custom);
  @override
  EntryFormCus1State createState() => EntryFormCus1State(this.custom);
}

//class controller
class EntryFormCus1State extends State<EntryFormCus1> {
  Custom custom;
  EntryFormCus1State(this.custom);
  TextEditingController pemesanController = TextEditingController();
  TextEditingController bahan1Controller = TextEditingController();
  TextEditingController ukuran1Controller = TextEditingController();
  TextEditingController bahan2Controller = TextEditingController();
  TextEditingController ukuran2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //kondisi
    if (custom != null) {
      pemesanController.text = custom.pemesan;
      bahan1Controller.text = custom.bahan1;
      ukuran1Controller.text = custom.ukuran1.toString();
      bahan2Controller.text = custom.bahan2;
      ukuran2Controller.text = custom.ukuran2.toString();
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          title: custom == null ? Text('Tambah') : Text('Ubah'),
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
                  controller: pemesanController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Pemesan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // bahan1
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: bahan1Controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Bahan 1',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              //ukuran1
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: ukuran1Controller,
                  keyboardType:
                      TextInputType.number, //keyboard inputan hanya angka
                  decoration: InputDecoration(
                    labelText: 'Ukuran 1 dalam ml',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              //bahan2
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: bahan2Controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Bahan 2',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              //ukuran2
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: ukuran2Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Ukuran 2 dalam ml',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {},
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
                          if (custom == null) {
                            // tambah data
                            custom = Custom(
                                pemesanController.text,
                                bahan1Controller.text,
                                int.parse(ukuran1Controller.text),
                                bahan2Controller.text,
                                int.parse(ukuran2Controller.text));
                          } else {
                            // ubah data
                            custom.pemesan = pemesanController.text;
                            custom.bahan1 = bahan1Controller.text;
                            custom.ukuran1 = int.parse(ukuran1Controller.text);
                            custom.bahan2 = bahan2Controller.text;
                            custom.ukuran2 = int.parse(ukuran2Controller.text);
                          }
                          // kembali ke layar sebelumnya dengan membawa objek item
                          Navigator.pop(context, custom);
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

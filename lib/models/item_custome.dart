class Custom {
  //variabel
  int _id;
  String _pemesan;
  String _bahan1;
  int _ukuran1;
  String _bahan2;
  int _ukuran2;

// mengambil dan mengembalikan nilai yang dimasukkan ke constructor per variabel
  get id => _id;

  get bahan1 => this._bahan1;
  set bahan1(String value) => this._bahan2 = value;

  get bahan2 => this._bahan2;
  set bahan2(String value) => this._bahan2 = value;

  get ukuran1 => this._ukuran1;
  set ukuran1(value) => this._ukuran1 = value;

  get ukuran2 => this._ukuran2;
  set ukuran2(value) => this._ukuran2 = value;

  get pemesan => this._pemesan;
  set pemesan(String value) => this._pemesan = value;

// constructor untuk menyimpan hasil inputan
  Custom(
      this._pemesan, this._bahan1, this._ukuran1, this._bahan2, this._ukuran2);
//constructor dengan namba tambahan agar constructor pertama tidak error
//jika dipanggil akan mengambil data dari sql yang berbentuk Map, setelah itu disimpan kembali berbentuk variabel
  Custom.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._pemesan = map['pemesan'];
    this._bahan1 = map['bahan1'];
    this._ukuran1 = map['ukuran1'];
    this._bahan2 = map['bahan2'];
    this._ukuran2 = map['ukuran2'];
  }

//metod untuk memasukkan setter dan getter ke dalam map
//untuk nantinya  dipanggila lagi untuk membuat method update dan insert
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['pemesan'] = this._pemesan;
    map['bahan1'] = this._bahan1;
    map['ukuran1'] = this._ukuran1;
    map['bahan2'] = this._bahan2;
    map['ukuran2'] = this._ukuran2;
    return map;
  }
}

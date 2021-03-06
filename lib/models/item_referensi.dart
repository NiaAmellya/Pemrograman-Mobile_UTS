class Item {
//variabel
  String _merk;
  String _jenis;
  int _id;
  int _harga;
  int _stok;
  int _kode;
  String _bahan;

// mengambil dan mengembalikan nilai yang dimasukkan ke constructor per variabel
  get id => _id;

  get merk => this._merk;
  set merk(String value) => this._merk = value;

  get jenis => this._jenis;
  set jenis(String value) => this._jenis = value;

  get harga => this._harga;
  set harga(value) => this._harga = value;

  get stok => this._stok;
  set stok(value) => this._stok = value;

  get kode => this._kode;
  set kode(value) => this._kode = value;

  get bahan => this._bahan;
  set bahan(String value) => this._bahan = value;

// constructor untuk menyimpan hasil inputan
  Item(this._kode, this._jenis, this._merk, this._stok, this._harga);
//constructor dengan namba tambahan agar constructor pertama tidak error
//jika dipanggil akan mengambil data dari sql yang berbentuk Map, setelah itu disimpan kembali berbentuk variabel
  Item.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._kode = map['kode'];
    this._jenis = map['jenis'];
    this._merk = map['merk'];
    this._stok = map['stok'];
    this._harga = map['harga'];
  }

  //metod untuk memasukkan setter dan getter ke dalam map
//untuk nantinya  dipanggila lagi untuk membuat method update dan insert
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['kode'] = this._kode;
    map['jenis'] = this._jenis;
    map['merk'] = this._merk;
    map['stok'] = this._stok;
    map['harga'] = this._harga;
    return map;
  }
}

import 'package:flutter/material.dart';
import 'package:test_tab_flutter/models/cart.dart';

class InputBelanja extends StatelessWidget {

    final List<Cart> dt;
  
  InputBelanja(this.dt);
  
  //BUAT CONTROLLER UNTUK MENG-HANDLE TEXTFIELD INPUT
  final titleController = TextEditingController();
  final hargaController = TextEditingController();
  final qtyController = TextEditingController();

  //METHOD INI AKAN BERJALAN KETIKA TOMBOL DARI WIDGET FLATBUTTON DITEKAN
  void saveNewItem() {
      //MENGAMBIL VALUE DARI MASING-MASING CONTROLLER INPUTAN DAN MENYIMPANNYA KE DALAM VARIABLE BARU
    final title = titleController.text;
    final harga = hargaController.text;
    final qty = int.parse(qtyController.text);

    //CEK JIKA TIDAK SESUAI RULE DARI KONDISI IFNYA
    

    _addNewItem(title, double.parse(harga), qty);
    
  }

  void _addNewItem(String title, double harga, int qty) {
    
    //BUAT FORMAT DATANYA DENGAN REFERENSI MENGGUNAKAN MODAL Cart
    final newItem = Cart(id: DateTime.now().toString(), title: title, harga: harga, qty: qty);
      dt.add(newItem); //SET STATE-NYA UNTUK MENAMBAHKAN DATA BARU TERSEBUT
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Nama Barang'),
              controller: titleController, //CONTROLLER INI SERUPA DENGAN NAME PADA INPUTAN HTML
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Harga'),
              controller: hargaController,
              keyboardType: TextInputType.number, //KEYBOARDNYA HANYA AKAN MENAMPILKAN ANGKA
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Qty'),
              controller: qtyController,
              keyboardType: TextInputType.number,
            ),
            FlatButton(
              child: Text('Tambah'),
              onPressed: (){
                saveNewItem();
              }, //KETIKA DITEKAN JALANKAN METHOD saveNewItem
              textColor: Colors.pink,
            )
          ],
        ),
      ),
    );
  }
  
}
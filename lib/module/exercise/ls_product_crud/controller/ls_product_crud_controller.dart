import 'package:example/core.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';

class LsProductCrudController extends State<LsProductCrudView>
    implements MvcController {
  static late LsProductCrudController instance;
  late LsProductCrudView view;

  @override
  void initState() {
    instance = this;
    loadProductList();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  bool ready = false;
  List productList = [];
  Faker faker = Faker.instance;

  loadProductList() async {
    ready = true;
    setState(() {
      productList = mainStorage.get("products") ?? [];
    });
    /*
    TODO: --
    1. Ok, baca storage "products" dan masukkan ke dalam List
    ###
    productList = mainStorage.get("products") ?? [];
    ###

    2. Panggil setState setelah-nya!
    */
  }

  addProduct(Map newProduct) async {
    setState(() {
      productList.add(newProduct);
      saveproductList();
    });

    /*
    3. Variabel map, berisi data yang di generate Faker
    Yuk, kita simpan data user ketika kita menekan tombol add
    Simpel, tambahkan item ke dalam List dengan kode ini:
    ###
    productList.add(newProduct);
    ###

    4. Next, panggil setState agar perubahan-nya di update ke dalam View

    5. Nah, ini bagian yang sangat penting.
    Panggil function saveproductList()
    Untuk menyimpan productList ke dalam storage.
    Supaya apa? Supaya tidak hilang ketika kita membuka aplikasi kembali
    ###
    saveproductList();
    ###

    6. Selalu panggil function di atas, untuk menyimpannya ke storage. >_<
    */
  }

  delete(item) {
    setState(() {
      productList.remove(item);
      saveproductList();
    });
    /*  
    7. Yuk kita delete item yang dipilih dari list
    gunakan kode ini:
    ###
    productList.remove(item)
    ###

    8. Panggil setState setelah-nya

    9. Panggil function saveproductList();
    */
  }

  edit(item) {
    setState(() {
      item["product_name"] = faker.commerce.productName();
      saveproductList();
    });
    /*  
    7. Yuk kita update item yang dipilih dari list
    gunakan kode ini:
    ###
    item["product_name"] = faker.commerce.productName();
    ###

    8. Panggil setState setelah-nya

    9. Panggil function saveproductList();

    10. Nah, coba test case ini:
    - Tambahkan data dengan menekan tombol add
    - Edit data dengan menekan tombol edit
    - Hapus data dengan menekan tombol delete

    Apakah ketiga fungsi itu bekerja?
    Kalau bekerja, coba lakukan hot-restart,
    Dan buka kembali view ini,
    Apakah data yang kamu ubah masih muncul?
    Jika ya, task ini selesai! 
    */
  }

  saveproductList() {
    mainStorage.put("products", productList);
  }
}

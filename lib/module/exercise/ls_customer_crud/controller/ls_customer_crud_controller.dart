import 'package:example/core.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';

class LsCustomerCrudController extends State<LsCustomerCrudView>
    implements MvcController {
  static late LsCustomerCrudController instance;
  late LsCustomerCrudView view;

  @override
  void initState() {
    instance = this;
    loadCustomerList();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  bool ready = false;
  List customerList = [];
  Faker faker = Faker.instance;

  loadCustomerList() async {
    ready = true;
    customerList = mainStorage.get("customers") ?? [];
    setState(() {});
    /*
    TODO: --
    1. Ok, baca storage "customers" dan masukkan ke dalam List
    ###
    customerList = mainStorage.get("customers") ?? [];
    ###

    2. Panggil setState setelah-nya!
    */
  }

  addCustomer(Map newCustomer) async {
    customerList.add(newCustomer);
    setState(() {});
    saveCustomerList();
    /*
    3. Variabel map, berisi data yang di generate Faker
    Yuk, kita simpan data user ketika kita menekan tombol add
    Simpel, tambahkan item ke dalam List dengan kode ini:
    ###
    customerList.add(newCustomer);
    ###

    4. Next, panggil setState agar perubahan-nya di update ke dalam View

    5. Nah, ini bagian yang sangat penting.
    Panggil function saveCustomerList()
    Untuk menyimpan customerList ke dalam storage.
    Supaya apa? Supaya tidak hilang ketika kita membuka aplikasi kembali
    ###
    saveCustomerList();
    ###

    6. Selalu panggil function di atas, untuk menyimpannya ke storage. >_<
    */
  }

  delete(item) {
    customerList.remove(item);
    setState(() {});
    saveCustomerList();
    /*  
    7. Yuk kita delete item yang dipilih dari list
    gunakan kode ini:
    ###
    customerList.remove(item)
    ###

    8. Panggil setState setelah-nya

    9. Panggil function saveCustomerList();
    */
  }

  edit(item) {
    item["customer_name"] = faker.name.firstName();
    setState(() {});
    saveCustomerList();
    /*  
    7. Yuk kita update item yang dipilih dari list
    gunakan kode ini:
    ###
    item["customer_name"] = faker.name.firstName();
    ###

    8. Panggil setState setelah-nya

    9. Panggil function saveCustomerList();

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

  saveCustomerList() {
    mainStorage.put("customers", customerList);
  }
}

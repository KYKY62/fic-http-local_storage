import 'package:example/core.dart';
import 'package:flutter/material.dart';

class LsLoginFormWithHistoryController extends State<LsLoginFormWithHistoryView>
    implements MvcController {
  static late LsLoginFormWithHistoryController instance;
  late LsLoginFormWithHistoryView view;

  @override
  void initState() {
    instance = this;
    loadLocalStorage();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String email = "";
  String password = "";
  bool ready = false;

  doLogin() async {}

  loadLocalStorage() async {
    /*
    TODO: --
    3. Ok, yuk kita ambil email dan password di storage,
    Dan ditampung di variabel email dan password.
    ###
    email = await mainStorage.get("email") ?? "";
    password = await mainStorage.get("password") ?? "";
    ###

    4. Di form ini kita punya state ready,
    Untuk menentukan form ini sudah siap untuk user atau belum
    Karena kita perlu menunggu future terlebih dahulu.
    So, yuk kita atur nilainya seperti ini:
    ###
    ready = true;
    setState(() {});
    ###

    5. Nice, sekarang setiap kali membuka Form,
    Nilai variabel email dan password akan selalu mengambil dari storage

    6. Lanjut point 7
    */
    email = await mainStorage.get("email") ?? "";
    password = await mainStorage.get("password") ?? "";
    ready = true;
    setState(() {});
  }

  saveToLocalStorage() async {
    /*  
    7. Function ini akan selalu dipanggil ketika ada perubahan
    pada email dan password. 
    Function ini akan dipanggil di event onChanged.
    Mari kita isi dulu function-nya~

    Function ini perlu menyimpan email dan password ke storage,
    Gunakan kode ini:
    ###
    mainStorage.put("email", email);
    mainStorage.put("password", password);
    ###

    8. Nice, buka lagi View-nya lanjut ke point 9
    */
    mainStorage.put("email", email);
    mainStorage.put("password", password);
  }
}

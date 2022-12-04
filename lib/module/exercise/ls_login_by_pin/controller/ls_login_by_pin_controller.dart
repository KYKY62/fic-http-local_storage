import 'package:example/core.dart';
import 'package:flutter/material.dart';

class LsLoginByPinController extends State<LsLoginByPinView>
    implements MvcController {
  static late LsLoginByPinController instance;
  late LsLoginByPinView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String pin = "";

  updatePin(int number) async {
    if (pin.length >= 4) return;
    pin += number.toString();
    setState(() {});

    if (pin.length < 4) return;
    String currentPin = await mainStorage.get("pin") ?? "";
    if (pin != currentPin) {
      showInfoDialog("Pin Salah!");
      return;
    }
    await showInfoDialog("Berhasil Login!");
    Get.back();
    /*
    TODO: --
    1. Buat if statement 
    ###
    if (pin.length >= 4) return;
    ###

    Ini digunakan agar user tidak menginput lebih dari 4 karakter pin

    2. Ok, kita akan menambahkan digit pin,
    ke dalam variabel pin. Gunakan kode ini:
    ###
    if (pin.length >= 4) return;
    pin += number.toString();
    setState(() {});
    ###

    3. Nice, sekarang kita akan cek PIN-nya
    Jika pin yang di input sudah 4 digit.
    Gunakan kode ini:
    ###
    if (pin.length < 4) return;
    String currentPin = await mainStorage.get("pin") ?? "";
    if (pin != currentPin) {
      showInfoDialog("Pin Salah!");
      return;
    }
    ###

    4. Setelah statement di atas, tambahkan kode ini:
    ###
    await showInfoDialog("Berhasil Login!");
    Get.back();
    ###

    5. Coba input PIN yang sama dengan yang kamu buat sebelumnya.
    Jika alert Berhasil Login muncul,
    Tasks ini selesai!
    */
  }
}

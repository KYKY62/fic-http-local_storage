import 'package:example/core.dart';
import 'package:flutter/material.dart';

class LsFirstTimeSetupController extends State<LsFirstTimeSetupView>
    implements MvcController {
  static late LsFirstTimeSetupController instance;
  late LsFirstTimeSetupView view;
  bool? firstTimeSetup;

  @override
  void initState() {
    instance = this;
    checkFirstTimeSetup();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  checkFirstTimeSetup() async {
    /*
    TODO: --
    Ok, di tutorial kali ini, kita akan me-redirect user langsung ke
    halaman Dashboard (LsFirstTimeSetupDashboardView).
    Jika user sudah melakukan first time setup sebelum-nya.
    Bentuk-nya apapun , entah itu TOS, Privacy Policy dan lainnya.

    Cara-nya mudah, cukup simpen variabel boolean ke dalam storage,
    Lalu kita cek nilainya. Kalau true, maka kita arahkan ke halaman Dashboard.
    Jika false, jangan lakukan apapun. Kita akan tetap stay di halaman ini.
    */

    await Future.delayed(const Duration(seconds: 1));
    firstTimeSetup = await mainStorage.get("first_time_setup") ?? false;
    /*
    1. Tambahkan statement if, untuk mengevaluasi nilai dari firstTimeSetup
    Gunakan kode ini: (sebelum setState((){})

    if (firstTimeSetup!) {
      Get.offAll(const LsFirstTimeSetupDashboardView());
      return;
    }

    2. Nice, lanjut ke point 3
    */
    if (firstTimeSetup!) {
      Get.offAll(const LsFirstTimeSetupDashboardView());
      return;
    }
    setState(() {});
  }

  submit() async {
    /*
    3. Kita akan mengubah nilai first_time_setup menjadi true, 
    Ketika user melakukan klik di tombol submit (ada di bagian paling bawah)
    Gunakan kode ini:

    await mainStorage.put("first_time_setup", true);
    firstTimeSetup = await mainStorage.get("first_time_setup") ?? false;
    Get.offAll(const LsFirstTimeSetupDashboardView());

    4. Nice, sekarang coba test case seperti ini:
    - Klik tombol submit, apakah kamu diarahkan ke halaman dashboard?
    jika ya, klik tombol logout di dashboard
    Lalu masuk lagi ke halaman first Time Setup,
    Apakah kamu langsung di arahkan ke halaman dashboard?
    Jika ya, tasks ini selesai~
    */
    await mainStorage.put("first_time_setup", true);
    firstTimeSetup = await mainStorage.get("first_time_setup") ?? false;
    Get.offAll(const LsFirstTimeSetupDashboardView());
  }

  delete() async {
    await mainStorage.delete("first_time_setup");
    firstTimeSetup = await mainStorage.get("first_time_setup") ?? false;
    setState(() {});
  }
}

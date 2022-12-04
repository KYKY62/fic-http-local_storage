import 'package:flutter/material.dart';
import 'package:example/core.dart';

class LsUserSettingView extends StatefulWidget {
  const LsUserSettingView({Key? key}) : super(key: key);

  Widget build(context, LsUserSettingController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("LsUserSetting"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              /*
              TODO: --
              Ini sangat mudah, cukup ambil nilai storage-nya dan atur sebagai
              value dari SwitchListTile.
              Berikut adalah contoh-nya:
              */
              SwitchListTile(
                value: mainStorage.get("Dark mode") ?? false,
                title: const Text("Dark mode"),
                onChanged: (value) {
                  var current = mainStorage.get("Dark mode") ?? false;
                  mainStorage.put("Dark mode", !current);
                  controller.setState(() {});
                },
              ),
              SwitchListTile(
                value: mainStorage.get("Login as Admin") ?? false,
                title: const Text("Login as Admin"),
                onChanged: (value) {
                  var current = mainStorage.get("Login as Admin") ?? false;
                  mainStorage.put("Login as Admin", !current);
                  controller.setState(() {});
                },
              ),
              SwitchListTile(
                value: mainStorage.get("Experimental mode") ?? false,
                title: const Text("Experimental mode"),
                onChanged: (value) {
                  var current = mainStorage.get("Experimental mode") ?? false;
                  mainStorage.put("Experimental mode", !current);
                  controller.setState(() {});
                },
              ),
              SwitchListTile(
                value: mainStorage.get("Offline mode") ?? false,
                title: const Text("Offline mode"),
                onChanged: (value) {
                  var current = mainStorage.get("Offline mode") ?? false;
                  mainStorage.put("Offline mode", !current);
                  controller.setState(() {});
                },
              ),
              SwitchListTile(
                value: mainStorage.get("Cache mode") ?? false,
                title: const Text("Cache mode"),
                onChanged: (value) {
                  var current = mainStorage.get("Cache mode") ?? false;
                  mainStorage.put("Cache mode", !current);
                  controller.setState(() {});
                },
              ),
              /*
              1. Ok, dengan contoh di atas, buatlah beberapa pengaturan
              dengan SwitchListTile!
              ! Pastikan key yang digunakan berbeda!
              ! sesuaikan label-nya

              - Dark mode
              - Login as Admin
              - Experimental mode
              - Offline mode
              - Cache mode

              2. Coba ubah ke5 switchlist tile yang baru dibuat menjadi:
              - Dark mode => true
              - Login as Admin => false
              - Experimental mode => true
              - Offline mode => false
              - Cache mode => true

              Jika perubahan yang kamu lakukan tidak mempengarungi
              Switch yang lainnya, maka task ini selesai!
              */
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LsUserSettingView> createState() => LsUserSettingController();
}

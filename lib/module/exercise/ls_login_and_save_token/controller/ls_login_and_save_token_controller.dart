import 'package:example/config.dart';
import 'package:example/core.dart';
import 'package:example/session.dart';
import 'package:flutter/material.dart';

class LsLoginAndSaveTokenController extends State<LsLoginAndSaveTokenView>
    implements MvcController {
  static late LsLoginAndSaveTokenController instance;
  late LsLoginAndSaveTokenView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String email = "admin@demo.com";
  String password = "123456";

  doLogin() async {
    showLoading();

    /*
    TODO: --
    1. Buat http request
    !snippet : dio_post
    @POST
    @URL
    "${AppConfig.baseUrl}/auth/action/login",

    @DATA
    data: {
      "email": email,
      "password": password,
    },

    2. Yuk kita baca response dari API-nya
    Gunakan kode ini:
    ###
    AppSession.token = obj["data"]["token"];
    ###

    (tambahkan kode di atas sebelum hideLoading yaa)

    3. Ok, kita sudah menyimpan token-nya ke dalam variabel
    token. Mari kita simpan juga itu ke storage.
    Gunakan kode ini:
    ###
    mainStorage.put("token", AppSession.token);
    ###

    4. Nice, sekarang setiap kali kamu membutuhkan token,
    Tinggal ambil itu di variabel ini:
    AppSession.token

    5. Jangan lupa, tambahkan kode ini di main.dart
    Agar nilai AppSession.token akan tersedia ketika
    Aplikasi-nya baru dibuka
    (Skip, point 5 tidak harus dikerjakan)

    ###
    AppSession.token = await mainStorage.get("token");
    ###

    6. Coba klik tombol login,
    Jika alert Login Success muncul,
    Tasks ini selesai!
    */

    var response = await Dio().post(
      "${AppConfig.baseUrl}/auth/action/login",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "email": email,
        "password": password,
      },
    );
    Map obj = response.data;
    AppSession.token = obj["data"]["token"];
    mainStorage.put("token", AppSession.token);

    hideLoading();
    print(AppSession.token);
    if (AppSession.token.isNotEmpty) {
      print("Login success!");
      await showInfoDialog("Login success!");
      Get.back();
    }
  }
}

import 'package:example/config.dart';
import 'package:example/core.dart';
import 'package:flutter/material.dart';

class HtLoginController extends State<HtLoginView> implements MvcController {
  static late HtLoginController instance;
  late HtLoginView view;

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

    if (obj["success"] == true) {
      showInfoDialog("Login success!");
    } else {
      showInfoDialog("Login gagal!");
    }
    /*
    TODO: --
    1. Buat sebuah post request menggunakan DIO
    ! snippet: dio_post
    Atur request-nya menjadi seperti ini:
    
    @POST
    @URL
    "${AppConfig.baseUrl}/auth/action/login"

    @DATA 
    "email": email,
    "password": password,

    2. Tambahkan kode ini setelah-nya:
    if(obj["success"]==true) {
      showInfoDialog("Login success!");
    }
    else {
      showInfoDialog("Login gagal!");
    }

    3. Cobalah isi dengan email asal,
    Jika alert Login Gagal muncul, kamu sudah berhasil
    Menyelesaikan tasks ini
    */
  }
}

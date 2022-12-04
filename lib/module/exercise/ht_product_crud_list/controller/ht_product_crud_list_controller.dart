import 'package:example/config.dart';
import 'package:example/core.dart';
import 'package:flutter/material.dart';

class HtProductCrudListController extends State<HtProductCrudListView>
    implements MvcController {
  static late HtProductCrudListController instance;
  late HtProductCrudListView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    loadProducts();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List productList = [];
  loadProducts() async {
    /*
    TODO: --
    10. buat http request
    @GET
    @URL
     "${AppConfig.baseUrl}/products",

    11. Tampung response ke dalam List, gunakan kode ini:
    productList = obj["data"];

    12. Panggil setState setelah-nya

    13. Yuk, kita test form-nya, klik tombl add,
    Isi dengan data yang sesuai, lalu klik tombol Save
    Jika yang di input muncul di dalam list,
    lanjut ke point 14

    14. Buka HtProductCrudFormView , lanjut point 15
    */

    var response = await Dio().get(
      "${AppConfig.baseUrl}/products",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    productList = obj["data"];
    setState(() {});
  }

  deleteAll() async {
    showLoading();
    var id = 2;
    var response = await Dio().delete(
      "${AppConfig.baseUrl}/products/action/delete-all",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    print(response.statusCode);

    await loadProducts();
    hideLoading();
  }

  delete(Map item) async {
    showLoading();
    var id = item["id"];
    var response = await Dio().delete(
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      "${AppConfig.baseUrl}/products/$id",
    );
    print(response.statusCode);
    //TODO: --
    /*
    33A. ketika user melakukan klik ke tombol delete di dalam item
    maka product tersebut akan di hapus.
    Jadi, buatlah sebuah http request
    !snippet : dio_delete

    @DELETE
    @URL
    "${AppConfig.baseUrl}/products/$id",

    33B. Ubah variabel id menjadi:
    var id = item["id"]

    34. Ok, klik tombol delete, jika data terhapus dari list
    Maka tasks PRODUCT CRUD selesai
    Whuff~
    */

    //! #############################
    //! Jangan ubah kode dibawah
    //! #############################
    await loadProducts();
    hideLoading();
  }
}

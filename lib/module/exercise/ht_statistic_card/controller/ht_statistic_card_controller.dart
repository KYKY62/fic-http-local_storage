import 'package:dio/dio.dart';
import 'package:example/config.dart';
import 'package:example/shared/util/random_image/random_image.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/ht_statistic_card_view.dart';

class HtStatisticCardController extends State<HtStatisticCardView>
    implements MvcController {
  static late HtStatisticCardController instance;
  late HtStatisticCardView view;

  @override
  void initState() {
    instance = this;
    loadProductCount();
    /*
    4. Panggil function loadProductCount() di dalam initState
    5. Klik tombol refresh, jika data pada statistic berubah,
    Kamu sudah berhasil menyelesaikan task ini
    */
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int productCount = 0;
  loadProductCount() async {
    productCount = 0;
    setState(() {});
    var url = "${AppConfig.baseUrl}/products/action/count";
    /*
    TODO: --
    1. Buat sebuah get request menggunakan DIO
    ! snippet: dio_get

    @GET
    @URL
    "${AppConfig.baseUrl}/products/action/count

    2. Masukkan response data ke dalam productList
    productCount = obj["data_count"];

    3. Panggil setState setelah-nya
    */
    var response = await Dio().get(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    productCount = obj["data_count"];
    setState(() {});
  }

  refresh() async {
    print("Refresh..");
    var faker = Faker.instance;
    for (var i = 0; i < 3; i++) {
      var response = await Dio().post(
        "${AppConfig.baseUrl}/products",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "photo": faker.generateRandomImage(),
          "product_name": faker.commerce.productName(),
          "price": faker.commerce.price(
            symbol: "",
          ),
          "description": faker.commerce.productDescription(),
        },
      );
    }
    await loadProductCount();
  }
}

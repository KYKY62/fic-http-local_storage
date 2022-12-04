import 'package:dio/dio.dart';
import 'package:example/config.dart';
import 'package:example/shared/util/random_image/random_image.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/ht_product_list_view.dart';

class HtProductListController extends State<HtProductListView>
    implements MvcController {
  static late HtProductListController instance;
  late HtProductListView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  deleteAll() async {
    var faker = Faker.instance;
    var response = await Dio().delete(
      "${AppConfig.baseUrl}/products/action/delete-all",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    loadProducts();
  }

  generateProducts() async {
    var faker = Faker.instance;
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
    Map obj = response.data;
    print(obj);
    loadProducts();
  }

  List productList = [];
  loadProducts() async {
    productList = [];
    setState(() {});

    /*
    TODO: --
    1. Buat sebuah get request menggunakan DIO
    ! snippet: dio_get

    @GET
    @URL
    "${AppConfig.baseUrl}/products"

    2. Masukkan response data ke dalam productList
    productList = obj["data"];

    3. Panggil setState setelah-nya

    4. Klik tombol Generate
    Jika ada product yang muncul di layar,
    Tasks ini selesai

    5. Klik tombol Refresh,
    Jika list-nya ter-refresh,
    Tasks ini selesai
    */

    var url = "${AppConfig.baseUrl}/products";

    var response = await Dio().get(
      url,
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
}

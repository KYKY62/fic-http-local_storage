import 'package:example/config.dart';
import 'package:example/core.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';

class HtDashboardController extends State<HtDashboardView>
    implements MvcController {
  static late HtDashboardController instance;
  late HtDashboardView view;

  loadData() async {
    await loadProducts();
    await loadProductCategories();
    setState(() {});
    /*
    7. Panggil function "await loadProducts()" di dalam function loadData
    8. Panggil function "await loadProductCategories" di function loadData
    9. Panggil setState setelah-nya
    10. Klik gambar SuperSale yang ada di dalamView 1x
    11. Back ke halaman sebelum-nya, lalu masuk ke halaman ini lagi
    12. Tasks ini selesai jika kamu berhasil memunculkan:
    - Daftar Product
    - Daftar Product Categories
    */
  }

  @override
  void initState() {
    instance = this;
    loadData();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List productList = [];
  List productCategoryList = [];

  generateProducts() async {
    var faker = Faker.instance;
    for (var i = 1; i <= 5; i++) {
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
  }

  generateProductCategories() async {
    var faker = Faker.instance;
    for (var i = 1; i <= 5; i++) {
      var response = await Dio().post(
        "${AppConfig.baseUrl}/product-categories",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "id": 1,
          "product_category_name": "Category $i",
        },
      );
    }
  }

  generate() async {
    await generateProductCategories();
    await generateProducts();
    showInfoDialog("Data generation success!");
  }

  loadProducts() async {
    productList = [];
    setState(() {});

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

    productList = obj['data'];
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
    */
  }

  loadProductCategories() async {
    productCategoryList = [];
    setState(() {});
    var url = "${AppConfig.baseUrl}/product-categories";

    var response = await Dio().get(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;

    productCategoryList = obj['data'];
    /*
    TODO: --
    4. Buat sebuah get request menggunakan DIO
    ! snippet: dio_get

    @GET
    @URL
    "${AppConfig.baseUrl}/product-categories"

    5. Masukkan response data ke dalam productCategoryList
    productCategoryList = obj["data"];

    6. Panggil setState setelah-nya
    */
  }
}

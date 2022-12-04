import 'package:example/core.dart';
import 'package:flutter/material.dart';

class LsFavoriteController extends State<LsFavoriteView>
    implements MvcController {
  static late LsFavoriteController instance;
  late LsFavoriteView view;

  @override
  void initState() {
    instance = this;
    loadProductList();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  bool ready = false;
  List productList = [];
  loadProductList() async {
    productList = mainStorage.get("products");
    print(productList.first["favorite"]);
    ready = true;
    setState(() {});
    /*
    TODO: --
    1. Ambil data product dari local storage, gunakan kode ini:
    ###
    productList = mainStorage.get("products");
    ###

    2. Setelah itu, panggil kode ini:
    ###
    ready = true;
    setState(() {});
    ###

    3. Lanjut ke point 4
    */
  }

  addToFavorite(Map item) {
    item["favorite"] = !item["favorite"];
    print(item["favorite"]);
    setState(() {});
    saveToLocalStorage();
    /*
    TODO: --
    4. Gunakan kode ini, untuk mengubah status product
    menjadi favorite = true:
    ###
    item["favorite"] = !item["favorite"];
    ###

    5. Panggil setState setelah-nya
    6. Panggil saveLocalStorage setelah setState
    7. Coba klik icon favorite di list bagian bawah,
    Apakah product yang kamu favoritkan muncul di list bagian atas?
    Jika muncul, coba hot-restart aplikasi-nya.
    Lalu buka kembali halaman ini, apakah product yang kamu favoritkan hilang?
    Jika tidak hilang, tasks ini selesai!
    */
  }

  saveToLocalStorage() async {
    mainStorage.put("products", productList);
  }
}

import 'dart:math';

import 'package:dio/dio.dart';
import 'package:example/config.dart';
import 'package:example/model/sales_data.dart';
import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../../../../shared/util/show_loading/show_loading.dart';
import '../view/ht_pie_chart_view.dart';

class HtPieChartController extends State<HtPieChartView>
    implements MvcController {
  static late HtPieChartController instance;
  late HtPieChartView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List<SalesData> salesDataList = [];
  loadSalesHistory() async {
    salesDataList = [];
    setState(() {});
    var url = "${AppConfig.baseUrl}/sales";
    /*
    TODO: --
    1. Buat sebuah get request menggunakan DIO
    ! snippet: dio_get

    @GET
    @URL
   "${AppConfig.baseUrl}/sales",

    2. Masukkan response data ke dalam salesDataList,
    gunakan looping seperti ini:
    ###
    List items = obj["data"];
    for (var i = 0; i < items.length; i++) {
      var item = items[i];
      salesDataList.add(
        SalesData(
          year: item["year"],
          sales: item["sales"],
        ),
      );
    }
    ###

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
    List items = obj["data"];
    for (var i = 0; i < items.length; i++) {
      var item = items[i];
      salesDataList.add(
        SalesData(
          year: item["year"],
          sales: item["sales"],
        ),
      );
    }
    setState(() {});
  }

  refresh({
    bool regenerateDummy = false,
  }) async {
    showLoading();
    print("Refresh..");
    var dataCount = await getDataCount();
    if (dataCount == 0 || regenerateDummy) {
      await deleteAll();
      for (var i = 0; i < 10; i++) {
        var response = await Dio().post(
          "${AppConfig.baseUrl}/sales",
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ),
          data: {
            "year": "${DateTime.now().year + i}",
            "sales": double.parse("${Random().nextInt(60)}"),
          },
        );
      }
    }
    await loadSalesHistory();
    hideLoading();
  }

  deleteAll() async {
    var id = 2;
    var response = await Dio().delete(
      "${AppConfig.baseUrl}/sales/action/delete-all",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }

  Future<int> getDataCount() async {
    var response = await Dio().get(
      "${AppConfig.baseUrl}/sales/action/count",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj["data_count"];
  }
}

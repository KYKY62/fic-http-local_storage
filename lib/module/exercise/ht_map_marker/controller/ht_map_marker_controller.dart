import 'package:example/config.dart';
import 'package:example/core.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class HtMapMarkerController extends State<HtMapMarkerView>
    implements MvcController {
  static late HtMapMarkerController instance;
  late HtMapMarkerView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List<Marker> markerList = [];
  loadMarkers() async {
    /*
    TODO: --
    1. Buat sebuah get request menggunakan DIO
    ! snippet: dio_get

    @GET
    @URL
    "${AppConfig.baseUrl}/user-positions",

    2. Buatlah sebuah List, tampung isi obj["data"]
    ###
    List list = obj["data"];
    ###

    3. Yuk, kita tambahkan marker dari response http
    Gunakan kode ini:
    ###
     for (var i = 0; i < list.length; i++) {
      var item = list[i];
      markerList.add(
        Marker(
          point: LatLng(
            item["latitude"],
            item["longitude"],
          ),
          builder: (context) => const Icon(
            Icons.person,
            color: Colors.green,
            size: 32,
          ),
        ),
      );
    }
    ###

    4. Panggil setState di akhir function

    5. Klik tombol add, jika marker muncul di Map,
    Tasks ini selesai
    */
    var response = await Dio().get(
      "${AppConfig.baseUrl}/user-positions",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    List list = obj["data"];
    for (var i = 0; i < list.length; i++) {
      var item = list[i];
      markerList.add(
        Marker(
          point: LatLng(
            item["latitude"],
            item["longitude"],
          ),
          builder: (context) => const Icon(
            Icons.person,
            color: Colors.green,
            size: 32,
          ),
        ),
      );
    }
    setState(() {});
  }

  addMarker() async {
    showLoading();
    await deleteAll();

    List<LatLng> positionList = [
      LatLng(
        -6.173340042768867,
        106.82741644024608,
      ),
      LatLng(
        -6.175601141102148,
        106.82737683145356,
      ),
      LatLng(
        -6.174973779938664,
        106.82675298011848,
      ),
      LatLng(
        -6.1739724811668735,
        106.8284128465617,
      ),
    ];

    for (var item in positionList) {
      var response = await Dio().post(
        "${AppConfig.baseUrl}/user-positions",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "latitude": item.latitude,
          "longitude": item.longitude,
        },
      );
      Map obj = response.data;
    }

    await loadMarkers();
    hideLoading();
  }

  deleteAll() async {
    showLoading();
    var response = await Dio().delete(
      "${AppConfig.baseUrl}/user-positions/action/delete-all",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    print(response.statusCode);
    markerList = [];

    await loadMarkers();
    hideLoading();
  }
}

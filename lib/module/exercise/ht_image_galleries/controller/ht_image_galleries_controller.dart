import 'dart:io';

import 'package:example/config.dart';
import 'package:example/core.dart';
import 'package:flutter/material.dart';

class HtImageGalleriesController extends State<HtImageGalleriesView>
    implements MvcController {
  static late HtImageGalleriesController instance;
  late HtImageGalleriesView view;

  @override
  void initState() {
    instance = this;
    //4. Panggil function loadImageGalleries();
    //5. Back ke halaman sebelum-nya, klik tombol + di atas
    //6. Jika gambar muncul di dalam List, lanjut ke point nomor 7
    loadImageGalleries();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List imageGalleries = [];
  loadImageGalleries() async {
    imageGalleries = [];
    setState(() {});
    /*
    TODO: --
    1. Buat sebuah get request menggunakan DIO
    ! snippet: dio_get

    @GET
    @URL
    "${AppConfig.baseUrl}/image-galleries?limit=100",

    2. Masukkan response data ke dalam productList
    imageGalleries = obj["data"];

    3. Panggil setState setelah-nya
    */

    var response = await Dio().get(
      "${AppConfig.baseUrl}/image-galleries?limit=100",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    imageGalleries = obj["data"];
    setState(() {});
  }

  uploadImage() async {
    var randomPhotos = [
      "https://i.ibb.co/SnzPNqd/photo-1576570734316-e9d0317d7384-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/t8DSnMP/photo-1528813860492-bb99459ec095-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/wQLn3BK/photo-1576568684258-5501fa2a0eb7-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/VQZqFLg/photo-1576568699715-bae7154950c7-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/G3rkDWB/photo-1600209142000-aa256622e64a-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/JRsb4Mb/photo-1490578474895-699cd4e2cf59-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/9TnxdGM/photo-1503001358144-8d7f2c1db9f5-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/XYvG1fR/photo-1492447166138-50c3889fccb1-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/G07swd8/photo-1496346236646-50e985b31ea4-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/BVD7RLs/photo-1495638488670-437e54b3bab4-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/5hgxTPZ/photo-1610500795224-fb86b02926d7-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/G3jqndg/photo-1593634804965-0394d1324bc4-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/tzJFRKX/photo-1495711497737-cb9591f6dd5e-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/wyWKd2J/photo-1523881374236-dd34f6ac1226-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/VDRkCMT/photo-1540429071038-04d88623bc9e-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
    ];
    randomPhotos.shuffle();
    addImage(randomPhotos.first);
    loadImageGalleries();
  }

  addImage(String url) async {
    var response = await Dio().post(
      "${AppConfig.baseUrl}/image-galleries",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "photo": url,
        "description": "-",
      },
    );
    Map obj = response.data;
  }

  deleteAll() async {
    var id = 2;
    var response = await Dio().delete(
      "${AppConfig.baseUrl}/image-galleries/action/delete-all",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    print(response.statusCode);
    loadImageGalleries();
  }

  doUploadAllPlatform() async {
    showLoading();
    hideLoading();
    /*
    7. Gunakan file picker yang support untuk semua platform
    !snippet: get_image_with_file_picker

    8. Nah, sekarang kamu sudah bisa mengambil gambar dengan
    file picker, Mari kita coba upload ke file hosting.
    Disini kita menggunakan IMGBB
    Bwt script Dio untuk upload file
    !snippet: dio_upload

    9. Nice, sekarang kamu sudah berhasil mengupload file dan
    mendapatkan url-nya!

    10. Tambahkan kita baris kode ini setelah-nya:
    ####
    await addImage(url);
    await loadImageGalleries();
    hideLoading();
    ####

    11. Klik tombol Upload 1
    (Cobalah di Platform Windows)

    12. Pilih file, dan lihatlah apakah gambar itu muncul
    Di dalam list, jika sudah muncul lanjut ke point 13
    */
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        "png",
        "jpg",
      ],
      allowMultiple: false,
    );
    if (result == null) return;
    File file = File(result.files.single.path!);
    String filePath = file.path;

    final formData = FormData.fromMap({
      'image': MultipartFile.fromBytes(
        File(filePath).readAsBytesSync(),
        filename: "upload.jpg",
      ),
    });

    var res = await Dio().post(
      'https://api.imgbb.com/1/upload?key=b55ef3fd02b80ab180f284e479acd7c4',
      data: formData,
    );

    var data = res.data["data"];
    var url = data["url"];

    await addImage(url);
    await loadImageGalleries();
    hideLoading();
  }

  doUploadAndroidIosAndWeb() async {
    showLoading();
    /*
    13. Ambil gambar dari gallery, gunakan snippet
    ! snippet: get_image_gallery 

    14. Nah, sekarang kamu sudah bisa mengambil gambar dengan
    image picker, Mari kita coba upload ke file hosting.
    Disini kita menggunakan IMGBB
    Bwt script Dio untuk upload file
    !snippet: dio_upload

    15. Oops, filePath mungkin saja null. Mari kita handle.
    setelah deklarasi String? filePath;

    String? filePath = image?.path;
    if(filePath == null) return;

    16. Tambahkan kita baris kode ini setelah kamu mengupload
    file ke imgbb
    ####
    await addImage(url);
    await loadImageGalleries();
    hideLoading();
    ####

    17. Klik tombol Upload 2, pilih sebuah file
    18. Jika file yang kamu pilih berhasil di upload,
    Tasks ini selesai!
    Selamat kamu sudah berhasil mengambil gambar dengan
    file picker dan image picker, dan mengupload-nya ke
    file hosting!
    */

    try {
      hideLoading();
      XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 40,
      );
      String? filePath = image?.path;
      if (filePath == null) return;
      final formData = FormData.fromMap({
        'image': MultipartFile.fromBytes(
          File(filePath).readAsBytesSync(),
          filename: "upload.jpg",
        ),
      });

      var res = await Dio().post(
        'https://api.imgbb.com/1/upload?key=b55ef3fd02b80ab180f284e479acd7c4',
        data: formData,
      );

      var data = res.data["data"];
      var url = data["url"];
      await addImage(url);
      await loadImageGalleries();
      hideLoading();
    } catch (e) {
      await showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Info'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Error not support in Windows'),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok"),
              ),
            ],
          );
        },
      );
      hideLoading();
    }
  }
}

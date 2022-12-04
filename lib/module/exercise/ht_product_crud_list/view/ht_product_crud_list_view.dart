import 'package:flutter/material.dart';
import 'package:example/core.dart';

/*
TODO: --
1. Buatlah sebuah FORM Product, klik tombol Add dibawah kanan,
buka HtProductCrudFormView
*/

class HtProductCrudListView extends StatefulWidget {
  const HtProductCrudListView({Key? key}) : super(key: key);

  Widget build(context, HtProductCrudListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("HtProductCrudList"),
        actions: [
          IconButton(
            onPressed: () => controller.deleteAll(),
            icon: const Icon(
              Icons.delete_sweep,
              size: 24.0,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Get.to(const HtProductCrudFormView());
          await controller.loadProducts();
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Card(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Products",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Row(
                            children: [
                              Text(
                                "${controller.productList.length}",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              const Text(
                                "+55%",
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                      child: const Icon(
                        Icons.wallet,
                        size: 24.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  var item = controller.productList[index];
                  //
                  return InkWell(
                    onTap: () async {
                      //TODO:--
                      /*
                      25. Tambahkan kode ini
                      ###
                      await Get.to(HtProductCrudFormView(
                        item: item,
                      ));
                      controller.loadProducts();
                      ###

                      26. Nice, mari kita update tombol save
                      Agar bekerja untuk mengupdate dan juga menambahkan data baru
                      Buka HtProductCrudFormController:
                      lanjut ke point 27
                      */
                      await Get.to(HtProductCrudFormView(
                        item: item,
                      ));
                      controller.loadProducts();
                    },
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          backgroundImage: NetworkImage(
                            item["photo"] ??
                                "https://i.ibb.co/S32HNjD/no-image.jpg",
                          ),
                        ),
                        title: Text("${item["product_name"]}"),
                        subtitle: Text("${item["price"]}"),
                        trailing: IconButton(
                          onPressed: () => controller.delete(item),
                          icon: const Icon(
                            Icons.delete,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<HtProductCrudListView> createState() => HtProductCrudListController();
}

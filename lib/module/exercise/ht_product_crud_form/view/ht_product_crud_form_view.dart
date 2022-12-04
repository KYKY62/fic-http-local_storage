import 'package:flutter/material.dart';
import 'package:example/core.dart';

class HtProductCrudFormView extends StatefulWidget {
  /*
  TODO: --
  15. ok, kita ingin agar form ini bisa mengedit file
  ! Mari tambahkan variabel ini:

  final Map item;

  ! lalu sesuaikan constructor-nya
  const HtProductCrudFormView({
    Key? key,
    required this.item,
  }) : super(key: key);

  16. ok, bagus lanjut ke point 17
  buka HtProductCrudFormController
  */
  final Map? item;
  const HtProductCrudFormView({
    this.item,
    Key? key,
  }) : super(key: key);

  Widget build(context, HtProductCrudFormController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("HtProductCrudForm"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () => controller.save(),
              child: const Text("Save"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                QImagePicker(
                  label: "Photo",
                  hint: "Your photo",
                  validator: Validator.required,
                  value: controller.photo,
                  onChanged: (value) {
                    controller.photo = value;
                  },
                ),
                QTextField(
                  label: "Product Name",
                  hint: "Name",
                  validator: Validator.required,
                  value: controller.photo,
                  onChanged: (value) {
                    controller.productName = value;
                  },
                ),
                QNumberField(
                  label: "Price Name",
                  hint: "Your age's",
                  validator: Validator.required,
                  value: controller.price.toString(),
                  onChanged: (value) {
                    controller.price = value.toDouble();
                  },
                ),
                QMemoField(
                  label: "Description",
                  hint: "Your addresses",
                  validator: Validator.required,
                  value: controller.description,
                  onChanged: (value) {
                    controller.description = value;
                  },
                ),
                /*
                TODO: --
                2. buat variabel photo, productName dan price
                di dalam !controller , buka HtProductCrudFormController

                String photo = "";
                String productName = "";
                double price = 0.0;
                String description = "";

                3. buat sebuah image picker,
                ! snippet : q_image_picker
                atur property-nya:
                label: photo 
                value: null 

                di dalam event onChanged, ambil value-nya
                Tampung di variabel controller.photo

                4. buat sebuah textfield,
                ! snippet : q_textfield
                atur property-nya:
                label: Product Name
                value: null 

                di dalam event onChanged, ambil value-nya
                Tampung di variabel controller.productName

                5. buat sebuah numberfield,
                ! snippet : q_numberfield
                atur property-nya:
                label: Price Name 
                value: null

                di dalam event onChanged, ambil value-nya
                Tampung di variabel controller.price
                Opps~, jangan lupa di konversi ke double!
                controller.price = double.parse(value);

                6. buat sebuah textarea/memofield,
                ! snippet : q_memofield
                atur property-nya:
                label: Description 
                value: null

                di dalam event onChanged, ambil value-nya
                Tampung di variabel controller.description


                7. Lanjut ke step berikut-nya, buka Controller
                Fokus ke function save()
                */

                /*
                TODO: ---
                lanjut kesini setelah menyelesaikan point 18
                19. Atur nilai awai dari image picker photo
                value: controller.photo,

                21. Atur nilai awai dari textfield product name
                value: controller.productName,

                22. Atur nilai awai dari number picker
                value: controller.price.toString(),

                23. Atur nilai awai dari memofield/textarea description
                value: controller.description,

                24. Buka Product List View lagi, (HtProductCrudListView)
                lanjut ke point 25
                (cek bagian kode yang memiliki InkWell di dalam ListViewBuilder)
                */
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<HtProductCrudFormView> createState() => HtProductCrudFormController();
}

import 'package:flutter/material.dart';
import 'package:example/core.dart';

class LsLoginFormWithHistoryView extends StatefulWidget {
  const LsLoginFormWithHistoryView({Key? key}) : super(key: key);

  Widget build(context, LsLoginFormWithHistoryController controller) {
    controller.view = this;

    if (controller.ready == false) {
      return Scaffold(
        body: Container(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("LsLoginFormWithHistory"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              QTextField(
                label: "Email",
                hint: "Your email",
                validator: Validator.email,
                value: controller.email,
                onChanged: (value) {
                  controller.email = value;
                  controller.saveToLocalStorage();
                },
              ),
              QTextField(
                label: "Password",
                hint: "Your password",
                obscure: true,
                validator: Validator.required,
                value: controller.password,
                onChanged: (value) {
                  controller.password = value;
                  controller.saveToLocalStorage();
                },
              ),
              /*
              1. Buat 2 textfield email dan password dengan property berikut

              ! snippet: q_textfield
              label: Email

              ! snippet: q_password
              label: Password

              TODO: textfield yang kamu buat belum terlihat,
              TODO: tidak apa apa, lanjut ke point 3 dulu

              2. Lanjut ke point 3, buka Controller
              */

              //! kode point 1
              //! disini

              //! End of kode point 1

              /*
              9. Ubah property dari textfield di atas
              ! textfield email:
              value: controller.email,
              onChanged: (value) {
                controller.email = value;
                controller.saveToLocalStorage();
              },

              ! textfield password:
              value: controller.password,
              onChanged: (value) {
                controller.password = value;
                controller.saveToLocalStorage();
              },

              10. Nice, setiap kali ada perubahan pada email dan password,
              Itu akan otomatis tersimpan ke storage.
              Yuk, kita isi email dan password-nya,
              Lalu tekan tombol back
              dan buka lagi Form ini.
              Jika apa yang kamu input muncul,
              Selamat tasks ini selesai!
              */
              //---------------------------------
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.login),
                  label: const Text("Login"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: () => controller.doLogin(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LsLoginFormWithHistoryView> createState() =>
      LsLoginFormWithHistoryController();
}

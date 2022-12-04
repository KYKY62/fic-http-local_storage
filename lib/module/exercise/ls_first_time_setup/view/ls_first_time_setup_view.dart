import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';
import 'package:example/core.dart';

class LsFirstTimeSetupView extends StatefulWidget {
  const LsFirstTimeSetupView({Key? key}) : super(key: key);

  header(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      width: MediaQuery.of(globalContext).size.width,
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget build(context, LsFirstTimeSetupController controller) {
    controller.view = this;
    Faker faker = Faker.instance;

    if (controller.firstTimeSetup == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("LsFirstTimeSetup"),
        leading: IconButton(
          onPressed: () {
            Get.offAll(const TrView());
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 24.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => controller.delete(),
            icon: const Icon(
              Icons.delete_sweep,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              header("Privacy Policy"),
              const Divider(),
              Text(
                faker.lorem.paragraph(
                  sentenceCount: 20,
                ),
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              header(faker.lorem.word(length: 10).capitalize()),
              const Divider(),
              Text(
                faker.lorem.paragraph(
                  sentenceCount: 20,
                ),
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              header(faker.lorem.word(length: 10).capitalize()),
              const Divider(),
              Text(
                faker.lorem.paragraph(
                  sentenceCount: 16,
                ),
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              header(faker.lorem.word(length: 10).capitalize()),
              const Divider(),
              Text(
                faker.lorem.paragraph(
                  sentenceCount: 18,
                ),
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  const Expanded(
                    child: Text("i agree with terms and conditions"),
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.check),
                    label: const Text("Submit"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () => controller.submit(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LsFirstTimeSetupView> createState() => LsFirstTimeSetupController();
}

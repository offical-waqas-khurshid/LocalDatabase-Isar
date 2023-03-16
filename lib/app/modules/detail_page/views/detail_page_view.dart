import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:local_database_isar/app/core/entitites/students.dart';

import '../../../core/network/local_database_provider.dart';
import '../controllers/detail_page_controller.dart';

class DetailPageView extends GetView<DetailPageController> {
  DetailPageView({Key? key}) : super(key: key);
  IsarService service = IsarService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Detail'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("${service.getStudents(Students()..isarAutoIncrement.toString())}"),
            Text("${service.getStudents(Students()..name.toString())}"),
            Text("${service.getStudents(Students()..isarAutoIncrement.toString())}"),
            ElevatedButton(
                onPressed: () {
                  service.getStudents(Students()..isarAutoIncrement.toString());
                  Get.snackbar("Alert!", "Data Get Sucessfully");
                },
                child: const Text("Get Data")),
          ],
        ),
      ),
    );
  }
}

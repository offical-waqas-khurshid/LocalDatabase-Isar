import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:local_database_isar/app/core/entitites/students.dart';
import 'package:local_database_isar/app/routes/app_pages.dart';

import '../../../core/entitites/students.dart';
import '../../../core/entitites/students.dart';
import '../../../core/network/local_database_provider.dart';
import '../controllers/detail_page_controller.dart';

class DetailPageView extends GetView<DetailPageController> {
  DetailPageView({Key? key}) : super(key: key);
  Students students = Students();

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
            SizedBox(
              height: 700,
              child: ListView.builder(
                itemCount: controller.studentsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${controller.studentsList[index].name}"),
                    leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: InkWell(
                            onTap: () {
                              //controller.deleteStudent();
                              Get.snackbar(
                                  "Delete", "Student Delete Successfully");
                            },
                            child: const Icon(Icons.delete))),
                    subtitle:
                        Text("${controller.studentsList[index].department}"),
                    trailing: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.HOME_PAGE,
                              arguments: [Students()]);
                        },
                        child: const Icon(
                          Icons.edit,
                          color: Colors.redAccent,
                        )),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

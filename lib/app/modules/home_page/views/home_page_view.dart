import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:local_database_isar/app/core/entitites/students.dart';
import 'package:local_database_isar/app/core/network/local_database_provider.dart';

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
   HomePageView({Key? key}) : super(key: key);
  IsarService service = IsarService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isar Database'),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controller.nameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                hintText: 'Enter name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.deptController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Department',
                hintText: 'Enter Department',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.semesterController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Semester',
                hintText: 'Enter Semester',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () async {
              Students students = Students();
              service.insertStudent(students..name = controller.nameController.text);
            service.insertStudent(students..department = controller.deptController.text);
            service.insertStudent(students..semester = controller.semesterController.text);
            Get.snackbar("Alert!", "Data inserted Sucessfully");
            controller.clearControllers();
            }, child: const Text("Done"))
          ],
        ),
      )),
    );
  }
}

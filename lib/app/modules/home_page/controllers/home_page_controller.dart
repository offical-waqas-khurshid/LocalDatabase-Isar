import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:local_database_isar/app/core/entitites/students.dart';

import '../../../core/network/local_database_provider.dart';

class HomePageController extends GetxController {
  IsarService service = IsarService();

  TextEditingController nameController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  TextEditingController semesterController = TextEditingController();

  void clearControllers() {
    nameController.clear();
    deptController.clear();
    semesterController.clear();
  }

  @override
  void onInit() async {
    super.onInit();
    print("""""""""""""""""""${nameController.text}");
    service.updateStudent(Students()..name = nameController.text);
     service.updateStudent(Students()..department = deptController.text);
     service.updateStudent(Students()..semester = semesterController.text);
  }
}

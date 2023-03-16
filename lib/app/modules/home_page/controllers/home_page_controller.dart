import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void clearControllers(){
    nameController.clear();
    deptController.clear();
    semesterController.clear();
    phoneController.clear();
  }
  @override
  void onInit() {
    super.onInit();
  }
}

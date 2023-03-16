import 'package:get/get.dart';
import 'package:local_database_isar/app/core/entitites/students.dart';

class DetailPageController extends GetxController {
  Students students = Students();

  List<String> studentsList = [];


  @override
  void onInit()  async {
    super.onInit();
    studentsList = (students.name) as List<String>;
    print("========================= $studentsList");
  }
}

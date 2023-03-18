import 'package:get/get.dart';
import 'package:local_database_isar/app/core/entitites/students.dart';

import '../../../core/network/local_database_provider.dart';

class DetailPageController extends GetxController {
  Students students = Students();

 List<Students> studentsList = [];

  IsarService service = IsarService();
  @override
  void onInit()  async{
    super.onInit();
    //studentsList = (students.name) as List<String>;
   // print("""""""""""""""""object""""""""""""""""");
    studentsList = await service.getStudents();
  }
}

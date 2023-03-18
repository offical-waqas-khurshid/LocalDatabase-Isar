import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:local_database_isar/app/core/entitites/students.dart';

import '../../../core/network/local_database_provider.dart';

class DetailPageController extends GetxController {
  IsarService service = IsarService();

 List<Students> studentsList = [];
 

  @override
  void onInit()  async{
    super.onInit();
    studentsList = await service.getStudents();
    studentsList = await service.deleteStudent();
    
  }

}

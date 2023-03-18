import 'package:isar/isar.dart';

import '../entitites/students.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  ///TODO: Insert student method
  Future<void> insertStudent(Students newStudent) async {
    final isar = await db;
    isar.writeTxn(() => isar.students.put(newStudent));
  }

  /// Todo: Get Student method
  Future<List<Students>> getStudents() async {
    final isar = await db;
    return await isar.students.where().findAll();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [StudentsSchema],
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }
}

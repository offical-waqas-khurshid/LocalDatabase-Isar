import 'package:isar/isar.dart';

import '../entitites/students.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  ///TODO: Insert student method
  Future<void> insertStudent(Students student) async {
    final isar = await db;
    isar.writeTxn(() => isar.students.put(student));
  }

  /// Todo: Get Student method
  Future<List<Students>> getStudents() async {
    final isar = await db;
    return await isar.students.where().findAll();
  }

  /// Todo: update Student data method
  Future<void> updateStudent(Students students) async {
    final isar = await db;
    await isar.writeTxn(() => isar.students.put(students));
  }

  /// Todo: Delete Student data method
  deleteStudent(Students students) async {
    final isar = await db;
    await isar
        .writeTxn(() => isar.students.delete(students.isarAutoIncrement!));
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

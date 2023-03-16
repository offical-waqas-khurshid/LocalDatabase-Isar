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
  
  // Future<void> saveStudent(Students newStudent) async {
  //   final isar = await db;
  //   isar.writeTxnSync<int>(() => isar.students.putSync(newStudent));
  // }

  // Future<void> saveTeacher(Teacher newTeacher) async {
  //   final isar = await db;
  //   isar.writeTxnSync<int>(() => isar.teachers.putSync(newTeacher));
  // }
  //
  // Future<void> saveCourse(Course newCourse) async {
  //   final isar = await db;
  //   isar.writeTxnSync<int>(() => isar.courses.putSync(newCourse));
  // }
  //
  // Future<List<Course>> getAllCourses() async {
  //   final isar = await db;
  //   return await isar.courses.where().findAll();
  // }
  //
  // Stream<List<Course>> listenToCourses() async* {
  //   final isar = await db;
  //   yield* isar.courses.where().watch(initialReturn: true);
  // }

  // Future<void> cleanDb() async {
  //   final isar = await db;
  //   await isar.writeTxn(() => isar.clear());
  // }
  //
  // Future<List<Students>> getStudentsFor(Course course) async {
  //   final isar = await db;
  //   return await isar.students
  //       .filter()
  //       .courses((q) => q.idEqualTo(course.id))
  //       .findAll();
  // }
  //
  // Future<Teacher?> getTeacherFor(Course course) async {
  //   final isar = await db;
  //   final teacher = await isar.teachers
  //       .filter()
  //       .course((q) => q.idEqualTo(course.id))
  //       .findFirst();
  //
  //   return teacher;
  // }

  // Future<Isar> openDB() async {
  //   if (Isar.instanceNames.isEmpty) {
  //     return await Isar.open(
  //       [StudentsSchema],
  //       inspector: true,
  //     );
  //   }
  //
  //   return Future.value(Isar.getInstance());
  // }
 Future<Isar> openDB() async {
    if(Isar.instanceNames.isEmpty){
      return await Isar.open([StudentsSchema], inspector: true,);
    }
    return Future.value(Isar.getInstance());
 }
}

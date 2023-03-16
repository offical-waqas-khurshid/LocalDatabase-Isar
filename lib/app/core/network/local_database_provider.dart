import 'package:isar/isar.dart';
class IsarService{
  late Future<Isar> db;
  IsarService(){
    db = OpenDB();
  }
}
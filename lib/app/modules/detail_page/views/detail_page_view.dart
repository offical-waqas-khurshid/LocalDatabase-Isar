import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:local_database_isar/app/core/entitites/students.dart';

import '../../../core/entitites/students.dart';
import '../../../core/entitites/students.dart';
import '../../../core/network/local_database_provider.dart';
import '../controllers/detail_page_controller.dart';

class DetailPageView extends GetView<DetailPageController> {
  DetailPageView({Key? key}) : super(key: key);
  IsarService service = IsarService();
  Students students = Students();


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Detail'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(future: service.getStudents(),builder: (context,snap){
          if(snap.hasData){
            return ListView.builder(itemCount:snap.data?.length??0,itemBuilder: (context,index){
              return ListTile(title: Text("${snap.data?[index]?.name??""}"),);
            });
          }else if(snap.hasError){
            return Text("${snap.error}");
          }else{
            return CircularProgressIndicator();
          }
        },),
      ),
    );
  }
}

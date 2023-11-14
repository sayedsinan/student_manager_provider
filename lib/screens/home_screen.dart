import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
import 'package:provider_student/colors/colors.dart';
import 'package:provider_student/db_functions/db_functions.dart';
import 'package:provider_student/screens/add_screen.dart';
import 'package:provider_student/widgets/studnet_home_tile.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<StudentDbFunctions>(context, listen: false)
            .getallStudents();
      },
    );
    context.read<StudentDbFunctions>().imgstring = '';
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("Teacher's Record",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.grey[500],
          child: Consumer<StudentDbFunctions>(
            builder: (context, value, child) {
              if (value.studentlistNotifier.isEmpty) {
                return Center(
                  child: Text(
                    "No Data found",
                    style: TextStyle(color: kWhite),
                  ),
                );
              }
              return ListView.separated(
                itemBuilder: (ctx, index) {
                  return StudentHomeTile(
                    data: value.studentlistNotifier[index],
                  );
                },
                separatorBuilder: (ctx, index) {
                  return Divider(
                    color: kWhite,
                    indent: 15,
                    endIndent: 10,
                    thickness: 3,
                  );
                }, 
                itemCount: value.studentlistNotifier.length,
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: kPink,
          onPressed: () {
            Get.to(StudentAddScreen());
          },
        ),
      ),
    );
  }
}

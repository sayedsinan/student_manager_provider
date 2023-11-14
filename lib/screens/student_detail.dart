import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider_student/colors/colors.dart';
import 'package:provider_student/db_functions/db_functions.dart';
import 'package:provider_student/model/data_model.dart';
import 'package:provider_student/screens/edit_screen.dart';
import 'package:provider_student/widgets/tex_widget.dart';


class ScreenStudentDetails extends StatelessWidget {
  final StudentModel studentmodel;

  const ScreenStudentDetails({required this.studentmodel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Container(
            color: Colors.grey[500],
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: TextWidget(
                    title: 'details',
                  ),
                ),
                Divider(
                  color: kWhite,
                  thickness: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  radius: 50,
                  child: StudentDbFunctions().imgstring.trim().isEmpty
                      ? CircleAvatar(
                          radius: 100,
                          backgroundImage: MemoryImage(
                            const Base64Decoder().convert(
                              studentmodel.imgstri,
                            ),
                          ),
                        )
                      : Container(
                          color: kWhite,
                        ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Center(
                  child: Text(
                    'Name : ${studentmodel.name}',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: kWhite,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'Age: ${studentmodel.age}',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: kWhite,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'Phone: ${studentmodel.phoneNumber}',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: kWhite,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'Place: ${studentmodel.place}',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: kWhite,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 10,
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.black,
                      ),
                    ),
                    onPressed: () {
                      context.read<StudentDbFunctions>().imgstring = '';
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => StudentEditScreen(
                            studentmodel: studentmodel,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Edit',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Divider(
                  color: kWhite,
                  thickness: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
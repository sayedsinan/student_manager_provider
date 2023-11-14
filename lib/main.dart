import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:provider_student/db_functions/db_functions.dart';
import 'package:provider_student/model/data_model.dart';
import 'package:provider_student/screens/home_screen.dart';




void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); 
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(
    const StudentManagement(),
  );
}

class StudentManagement extends StatelessWidget {
  const StudentManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StudentDbFunctions(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const StudentHomeScreen(),
      ),
    );
  }
}
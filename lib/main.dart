import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pankhuri/colors.dart';
import 'package:pankhuri/viewmodels/course_viewmodel.dart';
import 'package:pankhuri/views/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
          create: (context) => CourseViewModel(), child: HomePage()),
      theme: ThemeData(
          backgroundColor: AppColors.scaffoldBackGround,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            textTheme:
                TextTheme(headline1: TextStyle(color: AppColors.primaryColor)),
            backgroundColor: Colors.white,
          )),
    );
  }
}

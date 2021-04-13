import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pankhuri/colors.dart';
import 'package:pankhuri/model/course.dart';
import 'package:pankhuri/strings.dart';
import 'package:pankhuri/viewmodels/course_viewmodel.dart';
import 'package:pankhuri/widgets/dayCountWidget.dart';
import 'package:pankhuri/widgets/tagwidget.dart';
import 'package:provider/provider.dart';

import '../consts.dart';
import 'home_widgets/completed_section.dart';
import 'home_widgets/ordertile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final courseVM = Provider.of<CourseViewModel>(context, listen: false);
    courseVM.course = Course(
        name: AppStrings.courseName,
        currentDay: 1,
        regNumber: AppStrings.regNumber,
        dateDuration: '27-30 July',
        numberOfDays: 5,
        image: 'assets/image_card.png',
        nextClassOn: '2 July, 7.30 PM',
        time: '3.30-4.30 PM');
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text(
            AppStrings.appbarTitle,
            style: Theme.of(context).appBarTheme.textTheme.headline1,
          ),
          leading: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: TabBar(
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  labelStyle: TextStyle(fontSize: 20),
                  labelColor: AppColors.primaryColor,
                  indicator: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(10)),
                  tabs: List.generate(
                      tabs.length,
                      (index) => Tab(
                            text: tabs[index],
                          ))),
            ),
            Expanded(
              child: TabBarView(
                children: List.generate(
                    tabs.length,
                    (index) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: index == 0
                            ? Column(
                                children: [
                                  Consumer<CourseViewModel>(
                                      builder: (context, provider, child) =>
                                          OrderTile(provider.course)),
                                  CompletedSection(),
                                ],
                              )
                            : Container(
                                child: Center(
                                child: Text(tabs[index]),
                              )))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

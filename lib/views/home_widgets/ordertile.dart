import 'package:flutter/material.dart';
import 'package:pankhuri/model/course.dart';
import 'package:pankhuri/widgets/dayCountWidget.dart';
import 'package:pankhuri/widgets/tagwidget.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../colors.dart';
import '../../strings.dart';

class OrderTile extends StatelessWidget {
  final Course course;
  OrderTile(this.course);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Container(
                        height: 135,
                        child: Image.asset(course.image),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course.name,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                            Divider(),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: '${course.dateDuration}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ' | ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: '${course.time}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w600))
                            ])),
                            Divider(),
                            Text(
                              'Reg No.: ${course.regNumber}',
                              style: TextStyle(color: AppColors.disabledColor),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TimeLineSection(
                      course: course,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 30,
          child: TagWidget(
            title: AppStrings.confirm,
            height: 40,
            width: 100,
          ),
        )
      ],
    );
  }
}

class TimeLineSection extends StatelessWidget {
  final Course course;
  TimeLineSection({this.course});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: AppColors.lightGreen,
            child: Column(
              children: [
                SingleChildScrollView(
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        course.numberOfDays,
                        (index) => Container(
                            height: 50,
                            child: TimelineTile(
                              beforeLineStyle: LineStyle(
                                  color: index <= course.currentDay
                                      ? AppColors.primaryGreen
                                      : Colors.grey),
                              afterLineStyle: LineStyle(
                                  color: index < course.currentDay
                                      ? AppColors.primaryGreen
                                      : Colors.grey),
                              alignment: TimelineAlign.end,
                              startChild: index == course.currentDay
                                  ? Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 20,
                                        ),
                                        child: DayCountWidget('Day ${index}'),
                                      ),
                                    )
                                  : null,
                              axis: TimelineAxis.horizontal,
                              isFirst: index == 0,
                              isLast: index == course.numberOfDays - 1,
                              indicatorStyle: IndicatorStyle(
                                  height: 10,
                                  color: index <= course.currentDay
                                      ? AppColors.primaryGreen
                                      : Colors.grey),
                            ))),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.courseProgress,
                      style: TextStyle(color: AppColors.subtitleGrey),
                    ),
                    Text(
                      'Next Class: ${course.nextClassOn}',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

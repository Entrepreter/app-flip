import 'package:app_flip/app/data/constants/app_colors.dart';
import 'package:app_flip/app/data/constants/app_theme.dart';
import 'package:app_flip/app/data/constants/assets.dart';
import 'package:app_flip/app/utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(Assets.car_problems),
          ),
          buildServices(),
          SizedBox(
            height: 16,
          ),
          buildTrendingServices()
        ],
      ),
    );
  }

  final services = [
    "Car Care",
    "Dent Paint",
    "Wheel Service",
    "Car Service",
    "AC Service",
    "Inspection"
  ];

  buildServices() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Explore Services",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 16,
          ),
          GridView.builder(
              shrinkWrap: true,
              itemCount: services.length,
              physics: ClampingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          Assets.car_problems,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      services[i],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                );
              }),
        ],
      ),
    );
  }

  buildTrendingServices() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          color: Colors.blue.withOpacity(0.3)),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Trending services near you",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 16,
          ),
          ListView.separated(
            physics: ClampingScrollPhysics(),
            itemBuilder: (_, i) {
              return Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 96,
                      child: Stack(
                        children: [
                          ClipRRect(
                            child: Container(
                              child: Image.asset(
                                Assets.car_problems,
                                fit: BoxFit.cover,
                              ),
                              height: 76,
                              width: 76,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          Positioned(
                            top: 68,
                            left: 8,
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(6)),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                child: SizedBox(
                                  width: 42,
                                  height: 10,
                                ),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                              top: 68,
                              left: 8,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                child: Text(
                                  "20 % OFF",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.green),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.2),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(6)),
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Car Wash",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          buildSubText("Exterior Body"),
                          buildSubText("Seats & Boot"),
                          buildSubText("Foot Mats"),
                          Text(
                            "More Details",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 12),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: '${Utils().getCurrency()}1049',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87),
                                    children: <TextSpan>[
                                      TextSpan(text: '  '),
                                      TextSpan(
                                        text: '${Utils().getCurrency()}1099',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: primaryColor),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Text(
                                      "Add",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: 4,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 16,
            ),
          )
        ],
      ),
    );
  }

  buildSubText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Row(
        children: [
          Icon(
            Icons.done,
            color: Colors.green,
            size: 16,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            "$text",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

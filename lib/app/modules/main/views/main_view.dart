import 'package:app_flip/app/data/constants/assets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: Container(
          height: 56,
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Colors.grey.shade300, width: 0.5))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: controller.bottomNav.keys.map((e) {
              int index = controller.bottomNav.keys.toList().indexOf(e);
              return AnimatedContainer(
                  duration: Duration(),
                  child: index == controller.currentNavIndex.value
                      ? FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(controller.bottomNav[e]),
                          color: Colors.red.withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          label: Text(e))
                      : InkWell(
                          child: Icon(controller.bottomNav[e]),
                          onTap: () => controller.setNavIndex(index),
                        ));
            }).toList(),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(Assets.car),
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Divider(
                height: 1,
              )),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Delhi',
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.location_on_outlined,
                color: Colors.black87,
              )
            ],
          ),
          elevation: 0,
          centerTitle: true,
          actions: [
            Center(
              child: Container(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.notifications_none,
                        color: Colors.black87,
                      ),
                    ),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.red,
                        child: FittedBox(
                          child: Text(
                            "4",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        body: controller.currentPageView,
      ),
    );
  }


}

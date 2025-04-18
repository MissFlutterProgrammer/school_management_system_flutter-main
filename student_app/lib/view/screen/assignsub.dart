// ignore_for_file: use_super_parameters, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_app/controller/assigncontroller.dart';

Color darkblue = const Color.fromRGBO(65, 105, 225, 1);
Color white = const Color.fromRGBO(244, 241, 241, 1);
Color lightblue = const Color.fromRGBO(233, 238, 252, 1);

class AssignSub extends StatelessWidget {
  const AssignSub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: GetBuilder<AssignController>(
        init: AssignController(),
        builder: (controller) => GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 1.9,
            crossAxisSpacing: 30,
            mainAxisSpacing: 1,
          ),
          itemCount: controller.assignments.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Container(
                height: 150.h,
                width: 200.w,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: darkblue.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      // offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 5),
                      child: Row(
                        children: [
                          Text(
                            // "  Homework Name",
                            controller.assignments[index].title!,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: Checkbox(
                              activeColor: Colors.green,
                              checkColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              value: controller.isChecked.value,
                              onChanged: (
                                value,
                              ) {
                                controller.isChecked.value = value!;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      title: Text(
                                        "Your homework is done, thanks for your efforts ",
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w700,
                                          color: darkblue,
                                        ),
                                      ),
                                      // titlePadding: ,
                                      backgroundColor: white,
                                      scrollable: true,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        // "beo beo ahmad mohsen beo beo ahmad mohsenbeo beo ahmad mohsenbeo beo ahmad mohsenbeo beo ahmad mohsen",
                        controller.assignments[index].content!,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 175, top: 10),
                      child: Text(
                        // " Date : 10/7/2022",
                        controller.assignments[index].dueDate!,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

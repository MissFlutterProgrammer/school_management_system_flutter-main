// ignore_for_file: use_super_parameters, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Color darkblue = const Color.fromRGBO(65, 105, 225, 1);
Color white = const Color.fromRGBO(244, 241, 241, 1);
Color lightblue = const Color.fromRGBO(233, 238, 252, 1);

class Notify extends StatelessWidget {
  const Notify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      backgroundColor: white,
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 4,
            crossAxisSpacing: 30,
            mainAxisSpacing: 2,
          ),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 100.h,
              width: 200.w,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 141, 168, 209)
                        .withOpacity(0.5),
                    spreadRadius: 5,
                    // blurRadius: 7,
                    // offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 7),
                      child: Row(
                        children: [
                          Text(
                            "It's school",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 160),
                            child: Text(
                              " 7 hours ago",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "beo beo ahmad mohsen beo beo ahmad mohsenbeo beo ahmad mohsenbeo ",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  /*Padding(
                  padding: const EdgeInsets.only( top: 10,right: 280),
                  child: Text(
                    " 7 hours ago",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                )*/
                ],
              ),
            );
          }),
    );
  }
}

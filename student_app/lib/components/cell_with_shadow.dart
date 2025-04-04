// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Color darkblue = const Color.fromRGBO(65, 105, 225, 1);
Color white = const Color.fromRGBO(244, 241, 241, 1);
Color lightblue = const Color.fromRGBO(233, 238, 252, 1);

class CellWithShadow extends StatelessWidget {
  final String textInCell;
  const CellWithShadow({
    Key? key,
    required this.textInCell,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        height: 22.h,
        width: 50.w,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 248, 248, 248),
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
              color: darkblue.withOpacity(0.5),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Text(
          textInCell,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class ButtonWedgit extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const ButtonWedgit({required this.title,super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
      width: double.infinity,
      height: 137.h,
      decoration: BoxDecoration(
        color: const Color(0xff5865A3),
        borderRadius: BorderRadius.circular(70),
      ),
      child: Center(
        child: Text(
          title.tr(),
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      ),
        ),
    );
  }
}
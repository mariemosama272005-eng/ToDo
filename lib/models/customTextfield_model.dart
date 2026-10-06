import 'package:flutter/material.dart';

class CustomTextFieldModel {
  TextEditingController? controller;
  String title;
  int? maxLines;
  void Function()? onTap;

  CustomTextFieldModel( 
    {
      this.onTap,
    this.controller,
    this.maxLines, 
    required this.title,
    }
  );
}
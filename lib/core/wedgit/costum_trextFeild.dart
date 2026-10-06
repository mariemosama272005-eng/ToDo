// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:to_do_app/models/customTextfield_model.dart';

class CostumTextfeild extends StatelessWidget {
CustomTextFieldModel tf;   
  CostumTextfeild({
    Key? key,
    required this.tf,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  onTap: tf.onTap,
                  readOnly: tf.onTap!=null,
                  controller: tf.controller,
                  decoration: InputDecoration(
                    hintText: tf.title,
                    hintStyle: const TextStyle(
                      fontSize: 28,
                      color: Color(0xff5A5B65),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,

                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 35,
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
      
              );
  }
}

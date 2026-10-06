import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/core/utils/app_constans.dart';
import 'package:to_do_app/feature/login/data/user_model.dart';

class HomeAppbar extends StatelessWidget {

 UserModel?user=Hive.box<UserModel>(AppConstans.userBox).get(AppConstans.curruntUser);
  HomeAppbar({super.key});
  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(radius: 40.r,
          backgroundImage: kIsWeb
        ? Image.network(user?.image??"").image
        : Image.file(File(user?.image??"")).image), 
                
          
      20.horizontalSpace,
          Column(
            children: [
              Text("Good Morning👋🏻",style: TextStyle(
                color: Colors.grey,
              ),
              ),
              Text(user?.name??""),
            ],
          ),
          Spacer(),
          Icon(Icons.notifications_none_outlined,size: 30,)
        ],
      ),
    );
  }
}
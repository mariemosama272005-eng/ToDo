import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_app/core/utils/app_constans.dart';
import 'package:to_do_app/feature/home/home_screen.dart';
import 'package:to_do_app/feature/login/data/user_model.dart';
import 'package:to_do_app/feature/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){
      nextPage();

    });
    super.initState();
  }
  nextPage(){
    UserModel? user=Hive.box<UserModel>(AppConstans.userBox).get(AppConstans.curruntUser);
    if(user==null){
 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen ()));
    }
    
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset("assets/Icons/Checklist.json"),
      ),
    );
  }
}
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/feature/home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Center(
        child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed:(){
              if(context.locale.languageCode=='en'){
                context.setLocale(Locale("ar"));
              }
              else{
                context.setLocale(Locale("en"));
              }
            },icon: Icon(Icons.language)),
        
            Image.asset("assets/images/undraw_male-avatar_zkzx.png",width: 100.w,height: 150.h,),
            Text("create".tr(),style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
            Text("sub".tr(),style: TextStyle(
              fontSize: 16,
            
            ),),
           Padding(
             padding: const EdgeInsets.all(25.0),
             child: TextField(
                decoration: InputDecoration(
                  hintText: 'Ahmed Abdelsattar',
                  hintStyle: const TextStyle(
                    fontSize: 28,
                    color: Color(0xff5A5B65),
                  ),
                  filled: true,
                  fillColor: Colors.white,
             
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
           ),

            20.verticalSpace,
            GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  },
  child:Padding(
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
        'continue'.tr(),
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
    ),
  ),
            ),

        
        
          ],
        ),
      )
      ),
    );
  }
}
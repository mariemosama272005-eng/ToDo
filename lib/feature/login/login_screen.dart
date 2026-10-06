import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/core/utils/app_constans.dart';
import 'package:to_do_app/core/wedgit/button_wedgit.dart';
import 'package:to_do_app/core/wedgit/costum_trextFeild.dart';
import 'package:to_do_app/feature/home/home_screen.dart';
import 'package:to_do_app/feature/login/data/user_model.dart';
import 'package:to_do_app/models/customTextfield_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final picker = ImagePicker();
  XFile? photo;
 
  PickImageFromCarmera() async {
    photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      
    });
  }

  PickImageFromGallery() async {
   photo= await picker.pickImage(source: ImageSource.gallery);
   setState(() {
     
   });
  }
  SaveUserData(UserModel user){
    Hive.box<UserModel>(AppConstans.userBox).put(AppConstans.curruntUser,user).then((value) {
      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
      
    },).catchError((error){
      print(error);

    }
    );
  }
  var nameController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  if (context.locale.languageCode == 'en') {
                    context.setLocale(Locale("ar"));
                  } else {
                    context.setLocale(Locale("en"));
                  }
                },
                icon: Icon(Icons.language),
              ),

              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: ((context) => Column(
                      children: [
                        ButtonWedgit(
                          title: 'camera',
                          onTap: (){ 
                            Navigator.pop(context);
                            PickImageFromCarmera();
                            },
                        ),

                        ButtonWedgit(
                          title: 'gallery',
                          onTap: () { 
                            Navigator.pop(context);
                             PickImageFromGallery();
                             }
                        ),
                      ],
                    )),
                  );
                },
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey.shade100,
                  child: photo == null? Icon(Icons.person, color: Color(0xff5865A3), size: 60): null,
    backgroundImage: photo!=null?
    kIsWeb
        ? Image.network(photo!.path).image
        : Image.file(File(photo!.path)).image:null), 
                ),
              
              20.verticalSpace,
              Text(
                "create".tr(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("sub".tr(), style: TextStyle(fontSize: 16)),
              CostumTextfeild(tf:CustomTextFieldModel( controller: nameController,title: 'ahmed abdsatar') ),
                     20.verticalSpace,
              GestureDetector(
                onTap: () {
                  SaveUserData(UserModel(name: nameController.text, image: photo?.path??""));
                },
                child: ButtonWedgit(title: 'continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

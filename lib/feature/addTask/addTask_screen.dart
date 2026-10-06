import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/wedgit/costum_trextFeild.dart';
import 'package:to_do_app/models/customTextfield_model.dart';

class AddtaskScreen extends StatelessWidget {
  const AddtaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Add Task',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
       children: [
         CostumTextfeild(tf:CustomTextFieldModel(title: "add task")),
         20.verticalSpace,
         CostumTextfeild(tf: CustomTextFieldModel(maxLines:4, title: "Description"),),
         20.verticalSpace,
         Row(children: [
           Expanded(child: CostumTextfeild(tf:CustomTextFieldModel(title: "Date",onTap: (){
            showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2027));
           }))),
           10.horizontalSpace,
           Expanded(child: CostumTextfeild(tf:CustomTextFieldModel(title: "time",onTap: (){
            showTimePicker(context: context, initialTime: TimeOfDay.now());
           }))),
           
         ]
         )
         ]
      ),
      
    );
  }
}
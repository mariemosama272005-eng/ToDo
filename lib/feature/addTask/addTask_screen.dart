import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/core/data/sharedTask_model.dart';
import 'package:to_do_app/core/utils/app_constans.dart';
import 'package:to_do_app/core/wedgit/button_wedgit.dart';
import 'package:to_do_app/core/wedgit/costum_trextFeild.dart';
import 'package:to_do_app/feature/addTask/wedgit/statusDropDown_wedgit.dart';
import 'package:to_do_app/models/customTextfield_model.dart';

class AddtaskScreen extends StatefulWidget {
  const AddtaskScreen({super.key});

  @override
  State<AddtaskScreen> createState() => _AddtaskScreenState();
}

class _AddtaskScreenState extends State<AddtaskScreen> {
  @override
  List<Color>taskColor=[
Colors.blue,
Colors.orange,
Colors.purple,
Colors.green,
Colors.red,
  ];
  var titleController =TextEditingController();
  var descController =TextEditingController();
  var timeController =TextEditingController();
  var statusController =TextEditingController();
  var dateController =TextEditingController();
  int ? seclectedIndexColor;

  @override
  void dispose(){
    titleController.dispose();
    descController.dispose();
    timeController.dispose();
    statusController.dispose();
    dateController.dispose();
    super.dispose();
  }
    void saveTask(SharedtaskModel task){
      Hive.box<SharedtaskModel>(AppConstans.taskBox).add(task).then((value) {
        Navigator.pop(context);
      }).catchError((e){
        print(e.toString);
      });
    

  }
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
      body: SingleChildScrollView(
        child: Column(
         children: [
           CostumTextfeild(tf:CustomTextFieldModel(title: "add task",controller: titleController)),
         
           CostumTextfeild(tf: CustomTextFieldModel(maxLines:10, title: "Description",controller: descController)),
          
           Row(children: [
             Expanded(child: CostumTextfeild(tf:CustomTextFieldModel(title: "Date",controller: dateController,
             onTap: (){
              showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2027)).then((value) {
                dateController.text=DateFormat.yMd().format(value??DateTime.now());
              });
             }))),
           
             Expanded(child: CostumTextfeild(tf:CustomTextFieldModel(title: "time",controller: timeController,
             onTap: (){
              showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
                timeController.text=value?.format(context)??" ";

              });
             }))),
             
           ]
           ),
          
           StatusdropdownWedgit(
            onChange: (value){
              statusController.text=(value)??"";

            },
           ),
           10.verticalSpace,
           Text("choose task Color",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
           ),),
          SizedBox(
            height: 60.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index)=>InkWell(
                  onTap: (){
                    setState(() {
                      seclectedIndexColor=index;
                    
                    });
                  },
                  child: CircleAvatar(
                    
                    backgroundColor: taskColor[index],
                    child:index==seclectedIndexColor? Icon(Icons.check, color: Colors.white,size: 30,):null,
                  ),
                )
                , separatorBuilder:(context,index)=>10.horizontalSpace,
                 itemCount: taskColor.length),
            ),
          ),
        
        ButtonWedgit(title: "Save Task",
        onTap: (){
          saveTask( SharedtaskModel(
            color:taskColor[seclectedIndexColor??0].toARGB32(),
           title: titleController.text,
            date: dateController.text,
             description: descController.text,
              time: timeController.text,
               status: statusController.text));
        },
        ),
        
                   ]
        ),
      ),
      
    );
  }
}
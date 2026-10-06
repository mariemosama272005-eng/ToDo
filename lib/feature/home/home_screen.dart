import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/core/utils/app_constans.dart';
import 'package:to_do_app/feature/addTask/addTask_screen.dart';
import 'package:to_do_app/feature/home/wedgit/columnNum_wedgit.dart';
import 'package:to_do_app/feature/home/wedgit/home_appBar.dart';
import 'package:to_do_app/feature/home/wedgit/taskCard_wedgit.dart';
import 'package:to_do_app/feature/login/data/user_model.dart';
import 'package:to_do_app/models/cloumnN_model.dart';
import 'package:to_do_app/models/taskCard_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddtaskScreen()));
      }, label: Row(
        children: [
          Icon(Icons.add),
          Text("tasks"),    
        ],
      )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppbar(),
Container(
                  width: double.infinity,
                  
                  decoration:BoxDecoration(
                    color: Color(0xff5865A3),
                    borderRadius: BorderRadius.circular(30),
                  ) ,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      
                      children: [
                        ColumnnumWedgit(cM: CloumnnModel(number: "7", title: "Tasks")),
                        ColumnnumWedgit(cM: CloumnnModel(number: "5", title: "Done")),
                        ColumnnumWedgit(cM: CloumnnModel(number: "7", title: "pending")),
                      ],
                    ),
                  ),
                  
                  
                
                ),
              
              20.verticalSpace,
              Text("Today's Task",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
             
             Expanded(child: ListView.separated(itemBuilder: ((context, index) => tasks[index]), separatorBuilder: (context,index)=>10.verticalSpace, itemCount: 4)),

            
              
            ],
          
          ),
        ),
      ),
    );
  }
}
List<TaskcardWedgit>tasks=[
     TaskcardWedgit(tm: TaskcardModel(color: 0xffADD8E6, description: "bulid Register screen", title: "flutter task", status: "pending")),
     TaskcardWedgit(tm: TaskcardModel(color: 0xff90EE90, description: "GYM at 6 am", title: "Work out", status: "done")),
     TaskcardWedgit(tm: TaskcardModel(color: 0xffFFA500, description: "Team sync", title: "Meeting", status: "in progress")),
     TaskcardWedgit(tm: TaskcardModel(color: 0xffEE82EE, description: "atomic habits", title: "raed a book", status: "pending")),

];
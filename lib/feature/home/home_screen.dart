import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/core/data/sharedTask_model.dart';
import 'package:to_do_app/core/utils/app_constans.dart';
import 'package:to_do_app/feature/addTask/addTask_screen.dart';
import 'package:to_do_app/feature/home/wedgit/columnNum_wedgit.dart';
import 'package:to_do_app/feature/home/wedgit/home_appBar.dart';
import 'package:to_do_app/feature/home/wedgit/taskCard_wedgit.dart';
import 'package:to_do_app/feature/login/data/user_model.dart';
import 'package:to_do_app/models/cloumnN_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  @override
  Widget build(BuildContext context) {
    List<SharedtaskModel>tasks=Hive.box<SharedtaskModel>(AppConstans.taskBox).values.toList();
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(onPressed: ()async{
       await Navigator.push(context, MaterialPageRoute(builder: (context)=>AddtaskScreen()));
       setState(() {
         
       });
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
             
             Expanded(
                    child: tasks.isEmpty
                        ? const Center(
                            child: Text(
                              "No tasks yet",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          )
                        : ListView.separated(
                            itemBuilder: (context, index) {
                              return TaskcardWedgit(
                                task: tasks[index],
                              );
                            },

                            separatorBuilder: (context, index) {
                              return 10.verticalSpace;
                            },

                            itemCount: tasks.length,
                          ),
             ),
              
            ],
          
          ),
        ),
      ),
    );
  }
}

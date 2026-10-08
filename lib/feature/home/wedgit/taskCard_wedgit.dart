// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:to_do_app/core/data/sharedTask_model.dart';

class TaskcardWedgit extends StatelessWidget {
  SharedtaskModel? task;
  TaskcardWedgit({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
     
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              height: 80.h,
              width: 20.w,
              decoration: BoxDecoration(
                color: Color(task!.color),
                borderRadius: BorderRadius.circular(30),


              ),
            ),
           20.horizontalSpace,
              Column(
                children: [
                  Text(task?.title??"",style: TextStyle(
                    fontSize: 24,
                    fontWeight:FontWeight.bold,
              
                  ),
                  ),
                  
                  Text(task!.description,style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
              
                    
              
                  ),
                  ),
                 
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(task!.color).withValues(alpha: .1),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(task?.status??"",style: TextStyle(
                        fontSize: 20,
                        
                        color:Color(task!.color),
                                    
                      ),
                      ),
                    ),
                  ),
              
                ],
              ),
              Spacer(),
            
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

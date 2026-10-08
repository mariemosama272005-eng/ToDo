import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
enum Status{
pending,
completed,
inprogress
}

class StatusdropdownWedgit extends StatelessWidget {
  final void Function(String ?)?onChange;
  const StatusdropdownWedgit({required this.onChange,super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration:  InputDecoration(
                   label: Text("Status",style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                   ),
                   ),
                   hint: Text("Adjust status"),
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
      items:Status.values.map((e)=>
      DropdownMenuItem(value: e,child: Text(e.name))
      ).toList() ,
       onChanged: (v){
      onChange!(v?.name);
       });
  }
}
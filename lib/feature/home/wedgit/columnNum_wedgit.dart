// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:to_do_app/models/cloumnN_model.dart';

class ColumnnumWedgit extends StatelessWidget {
  CloumnnModel cM;
  ColumnnumWedgit({
    Key? key,
    required this.cM,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
              Text(cM.number ,style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,

      ),
      ),
      Text(cM.title,style: TextStyle(
                color: Colors.white,
                
      ),
      )
      ]
    );
  }
}

import 'package:flutter/material.dart';

class TaskStatus extends StatelessWidget {
  TaskStatus({Key? key, required this.task, required this.taskStatus})
      : super(key: key);
  String task;
  bool taskStatus;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width * .28,
      height: 50,
      decoration: BoxDecoration(
          color: taskStatus ? Colors.white : Color(0xCCE5EAFC),
          borderRadius: BorderRadius.circular(40)),
      child: Center(
        child: Text(
          task,
          style: TextStyle(fontFamily: taskStatus ? 'PoppinsBold' : 'Poppins', fontSize: 15,color: Color(0xFF2E3A59)),),

      ),
    );
  }
}

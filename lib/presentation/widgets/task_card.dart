import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class TaskCard extends StatelessWidget {
  String taskTitle;
  String TaskName;
  DateTime deadline;

  TaskCard(
      {Key? key,
      required this.taskTitle,
      required this.TaskName,
      required this.deadline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var date = DateFormat('MMMM dd  yyyy').format(deadline);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF9C2CF3),
                Color(0xFFCA1DFA)
              ]
          )),
      padding: EdgeInsets.all(15),
      width: width * .6,
      height: width * .6,
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.topRight,
              child: Container(
                width: width * .3,
                height: width*.3,
                decoration: BoxDecoration(
                    color: Colors.deepPurple.withOpacity(.3),
                    borderRadius: BorderRadius.circular(100)),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(children: <Widget>[
                Container(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: SvgPicture.asset('assets/icons/lamp.svg',width: 30,),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffB169FF).withOpacity(.6),
                    )),
                SizedBox(
                  width: 10,
                ),
                Text(
                  taskTitle,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'PoppinsBold',
                      fontSize: 24),
                ),
              ]),
              Text(
                TaskName,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'PoppinsBold',
                    fontSize: 28),
              ),
              Text(
                '${date}',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'PoppinsBold',
                    fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

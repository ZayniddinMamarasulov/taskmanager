
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class PorogressTask extends StatelessWidget {
  String taskTitle;
  String days;
  PorogressTask({Key? key,required this.taskTitle, required this.days}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width*.9,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF9C2CF3),
                  Color(0xFF3A49F9),
                ]
              ),
            ),
            child: Center(child: SvgPicture.asset('assets/icons/calendar.svg'),),
          ),
          SizedBox(width: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(taskTitle,style: TextStyle(fontSize: 22,fontFamily: 'PoppinsBold'),),
                  Text(days+"Days ago",style: TextStyle(color: Colors.grey,fontFamily: 'Poppins'),)
                ],
              ),
              SizedBox(width: 30,),
              IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_outlined,color: Colors.grey,)),
            ],
          )

        ],
      ),

    );
  }
}

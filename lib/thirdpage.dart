import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    bool isPressed=false;
    return Scaffold(
      body: SingleChildScrollView(
        child:
        Container(
          color: Color(0xff3A49F9),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff9C2CF3),Color(0xff3A49F9)],
                      begin: const FractionalOffset(1.0,0.0),
                      end: const FractionalOffset(1.0,1.0),
                      tileMode: TileMode.clamp
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0,right: 30),
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                      Row(
                        children:[
                          Icon(Icons.arrow_back,size: 32,color: Colors.white,),
                          SizedBox(width: 64,),
                          Text('Create a Task',
                            style: TextStyle(color: Colors.white,fontSize: 20),),
                          SizedBox(width: 64,),
                          Icon(Icons.search,size: 32,color: Colors.white,)
                        ],
                      ),

                      TextFormField(
                        style: TextStyle(color: Colors.white,fontSize: 30),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Name",
                          fillColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.white,fontSize: 20,letterSpacing: 3),
                        ),
                      ),
                      SizedBox(height: 14,),
                      TextFormField(
                        style: TextStyle(color: Colors.white,fontSize: 30),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Date",
                          fillColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.white,fontSize: 20,letterSpacing: 3),
                        ),
                      )

                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),

                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                ),
                child:Padding(
                  padding: const EdgeInsets.only(left:30.0,right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40,),
                      Row(
                        children: [
                          Text("Start Time",style: TextStyle(fontSize: 20,color: Color(0xffBFC8E8)),),
                          SizedBox(width: 70,),
                          Text("End Time",style: TextStyle(fontSize: 20,color: Color(0xffBFC8E8))),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Text("01:22 pm",style: TextStyle(fontSize: 28,color: Color(0xff2E3A59)),),
                          SizedBox(width: 50,),
                          Text("03:20 pm",style: TextStyle(fontSize: 28,color: Color(0xff2E3A59)),)
                        ],
                      ),
                      SizedBox(height: 20,),
                      Divider(
                        height: 3,
                        color: Color(0xffBFC8E8),
                      ),
                      SizedBox(height: 26,),
                      Text("Description",style: TextStyle(color: Color(0xffBFC8E8),fontSize: 20),),
                      SizedBox(height: 20,),
                      Text("Lorem ipsum dolor sit amet, "
                          "er adipiscing elit, sed dianummy "
                          "nibh euismod dolor sit amet, er adipiscing elit, "
                          "sed dianummy nibh euismod.",style:TextStyle(
                          color: Color(0xff2E3A59),fontSize: 20,height: 1.2
                      ),),
                      SizedBox(height: 20,),
                      Divider(
                        height: 3,
                        color: Color(0xffBFC8E8),
                      ),
                      SizedBox(height: 26,),
                      Text("Category",style: TextStyle(color: Color(0xffBFC8E8),fontSize: 20),),
                      SizedBox(height: 20,),
                      Row(children: [
                        Container(
                            decoration: BoxDecoration(
                              gradient:LinearGradient(
                          colors: [Color(0xff9C2CF3),Color(0xff3A49F9)],
                      begin: const FractionalOffset(1.0,0.0),
                      end: const FractionalOffset(1.0,1.0),
                      tileMode: TileMode.clamp
                  ),
                                color: Color(0xffE5EAFC),
                                borderRadius: BorderRadius.all(Radius.circular(50))
                            ),
                          width:104,
                          height: 46,
                          child:TextButton(
                            onPressed: () {
                              setState(() {
                                isPressed=!isPressed;
                              });
                            },
                            child:Center(child: Text('Design',style: TextStyle(color:Color(0xff2E3A59)),)),
                          )

                        ),
                        SizedBox(width: 5,),
                        Container(
                          width:104,
                          height: 46,
                          child: TextButton(
                            onPressed: (){},
                              child:Center(
                              child: Text('Meeting',style: TextStyle(color:Color(0xff2E3A59)),))),

                          decoration: BoxDecoration(
                              color: Color(0xffE5EAFC),
                              borderRadius: BorderRadius.all(Radius.circular(50))

                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          width:104,
                          height: 46,
                          child: TextButton(
                            onPressed: (){},
                            child: Center(child: Text('Coding',style: TextStyle(color:Color(0xff2E3A59)),)),
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xffE5EAFC),
                              borderRadius: BorderRadius.all(Radius.circular(50))

                          ),
                        )
                      ],),
                      SizedBox(height: 10,),
                      Row(children: [
                        Container(
                          width:104,
                          height: 46,
                          child: TextButton(
                            onPressed: (){},
                            child: Center(child: Text('BDE',style: TextStyle(color:Color(0xff2E3A59)),)),

                          ),
                          decoration: BoxDecoration(
                              color: Color(0xffE5EAFC),
                              borderRadius: BorderRadius.all(Radius.circular(50))

                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          width:104,
                          height: 46,
                          child: TextButton(
                            onPressed: (){},
                            child: Center(child: Text('Testing',style: TextStyle(color:Color(0xff2E3A59)),)),

                          ),
                          decoration: BoxDecoration(
                              color: Color(0xffE5EAFC),
                              borderRadius: BorderRadius.all(Radius.circular(50))

                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          width:104,
                          height: 46,
                          child: TextButton(
                            onPressed: (){},
                            child: Center(child: Text('Quick call',style: TextStyle(color:Color(0xff2E3A59)),)),

                          ),
                          decoration: BoxDecoration(
                              color: Color(0xffE5EAFC),
                              borderRadius: BorderRadius.all(Radius.circular(50))

                          ),
                        )
                      ],),
                      SizedBox(height: 26,),
                      Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Color(0xff9C2CF3),Color(0xff3A49F9)],
                                  begin: const FractionalOffset(1.0,0.0),
                                  end: const FractionalOffset(1.0,1.0),
                                  tileMode: TileMode.clamp
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(40))
                          ),
                        child: TextButton(
                          onPressed: (){},
                          child: Center(child: Text('Create task',style:
                            TextStyle(color: Colors.white,fontSize: 20)
                            ,),),)

                        ),
                      SizedBox(height: 40,)

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )


    );
  }
}

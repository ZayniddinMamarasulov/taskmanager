import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taskmanager/database_helper.dart';
import 'package:taskmanager/main_provider.dart';
import 'package:taskmanager/presentation/widgets/task_item.dart';
import '../../models/task.dart';
import '../widgets/task_card.dart';
import '../widgets/task_status.dart';

class MyHomePageScreen extends StatefulWidget {
  const MyHomePageScreen({Key? key}) : super(key: key);

  @override
  State<MyHomePageScreen> createState() => _MyHomePageScreenState();
}

class _MyHomePageScreenState extends State<MyHomePageScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = PageController(viewportFraction: 0.8, keepPage: true);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 0),
          color: Colors.grey.shade200,
          child: Column(children: <Widget>[
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icons/menu.svg',
                      width: 31,
                    )),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(right: 15),
                      child: SvgPicture.asset(
                        'assets/icons/user.svg',
                        width: 31,
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: height * .05,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Hello Rohan!",
                style: TextStyle(
                    fontFamily: 'PoppinsBold',
                    fontSize: 40,
                    color: Color(0xFF2E3A59),
                    height: 0.8),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "have a nice day",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    color: Color(0xFF2E3A59).withOpacity(.4),
                    height: 0.8),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TaskStatus(task: "My Tasks", taskStatus: true),
                TaskStatus(task: "In-progress", taskStatus: false),
                Container(
                    margin: EdgeInsets.only(right: 15),
                    child: TaskStatus(task: "Completed", taskStatus: false)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            projectList(width, height, controller),
            const SizedBox(
              height: 10,
            ),
            Container(
              // color: Colors.red.withOpacity(.4),
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotWidth: 12,
                  dotHeight: 12,
                  dotColor: Colors.deepPurple.withOpacity(.5),
                  activeDotColor: Colors.deepPurple,
                  spacing: 20.0,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Progress',
                style: TextStyle(fontFamily: 'PoppinsBold', fontSize: 18),
              ),
            ),
            tasksList()
          ]),
        ),
      ),
    );
  }

  Widget projectList(
    double width,
    double height,
    PageController controller,
  ) {
    return SizedBox(
        width: width,
        height: height * .25,
        child: PageView.builder(
            itemCount: 3,
            controller: controller,
            itemBuilder: (_, index) {
              return Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: TaskCard(
                      taskTitle: "Project 1",
                      TaskName: "Front end Development",
                      deadline: DateTime.now()));
            }));
  }

  Widget tasksList() {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: Consumer<MainProvider>(builder: (context, data, child) {
          return FutureBuilder(
              future: DatabaseHelper.intance.getTasks(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 10),
                  itemBuilder: (context, index) {
                    return TaskItem(snapshot.data![index]);
                  },
                  itemCount: snapshot.data?.length ?? 0,
                );
              });
        }));
  }
}

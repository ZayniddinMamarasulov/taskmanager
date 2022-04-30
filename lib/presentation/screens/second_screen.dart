import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmanager/database_helper.dart';
import 'package:taskmanager/presentation/widgets/task_item.dart';

import '../../main_provider.dart';
import '../../models/task.dart';
import 'create_task_screen.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F5FF),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            backgroundColor: Colors.white,
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    )),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.arrow_back,
                            size: 24,
                            color: Color(0xFF324646),
                          ),
                          Icon(
                            Icons.search,
                            size: 24,
                            color: Color(0xFF324646),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Oct, ",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "2020",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          addTaskButton()
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 0.0,
              child: Center(
                child: Text(' '),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Tasks",
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2E3A59)),
                        ),
                        tasksList()
                      ],
                    ));
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget addTaskButton() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CreateTaskPage(),
        ));
      },
      child: Container(
        height: 40,
        width: 118,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            colors: [
              Color(0xFF9C2CF3),
              Color(0xFF3A49F9),
            ],
          ),
          color: Colors.deepPurple.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
            child: Text(
          "+ Add Task",
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }

  Widget tasksList() {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
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

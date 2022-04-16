import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskmanager/app_colors.dart';
import 'package:taskmanager/tasks.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  late TimeOfDay time;
  late TimeOfDay time2;
  late TimeOfDay picket;
  late TimeOfDay picket2;
  var description=TextEditingController();

  void initState() {
    super.initState();
    time = TimeOfDay.now();
    time2 = TimeOfDay.now();
  }

  //select time
  Future<Null> selectTime(BuildContext context) async {
    picket = (await showTimePicker(context: context, initialTime: time))!;
    if (picket != null) {
      setState(() {
        time = picket;
      });
    }
  }

  Future<Null> selectTime2(BuildContext context) async {
    picket2 = (await showTimePicker(context: context, initialTime: time2))!;
    if (picket2 != null) {
      setState(() {
        time2 = picket2;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: const Color(0xff3A49F9),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff9C2CF3), Color(0xff3A49F9)],
                    begin: const FractionalOffset(1.0, 0.0),
                    end: const FractionalOffset(1.0, 1.0),
                    tileMode: TileMode.clamp),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Create a Task',
                          style: TextStyle(color: Colors.white, fontSize: 26),
                        ),
                        const Icon(
                          Icons.search,
                          size: 26,
                          color: Colors.white,
                        )
                      ],
                    ),
                    Form()
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Time(context),
                    const SizedBox(
                      height: 26,
                    ),
                    const Text(
                      "Description",
                      style: TextStyle(color: Color(0xffBFC8E8), fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      controller: ,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    divider(context),
                    const SizedBox(
                      height: 26,
                    ),
                    const Text(
                      "Category",
                      style: TextStyle(color: Color(0xffBFC8E8), fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Categories(context),
                    const SizedBox(
                      height: 30,
                    ),
                    CreateButton(),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget Time(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                selectTime(context);
                print(time);
              },
              child: Column(children: <Widget>[
                const Text("Start Time",
                    style: TextStyle(fontSize: 20, color: Color(0xffBFC8E8))),
                SizedBox(height: 10,),
                Text(
                  "${time.hour}:${(time.minute < 10) ? '0${time.minute}' : '${time.minute}'}",
                  style:
                      const TextStyle(fontSize: 28, color: Color(0xff2E3A59)),
                ),
                Divider(
                  height: 2,
                  color: Colors.grey,
                ),
              ]),
            ),
            InkWell(
              onTap: (){
                selectTime2(context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text("Start Time",
                      style: TextStyle(fontSize: 20, color: Color(0xffBFC8E8))),
                  SizedBox(height: 10,),
                  Text(
                    "${time2.hour}:${(time2.minute < 10) ? '0${time2.minute}' : '${time2.minute}'} ",
                    style:
                        const TextStyle(fontSize: 28, color: Color(0xff2E3A59)),
                  ),
                  Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget divider(BuildContext context) {
    return const Divider(
      height: 3,
      color: Color(0xffBFC8E8),
    );
  }

  Widget Categories(BuildContext context) {
    return Wrap(
        spacing: 10,
        runSpacing: 8,
        children: List.generate(CategoryTask.topics.length, (index) {
          var category = CategoryTask.topics[index];
          return ChoiceChip(
            padding: const EdgeInsets.all(16),
            selectedColor: AppColors.lightbottomGradient,
            disabledColor: AppColors.lightNoSelectColor,
            backgroundColor: AppColors.lightNoSelectColor,
            labelStyle: TextStyle(
                color: category.isSelected ? Colors.white : Colors.black),
            label: Text(category.title),
            selected: category.isSelected,
            onSelected: (value) {
              setState(() {
                category.isSelected = !category.isSelected;
              });
            },
          );
        }));
  }

  Widget CreateButton() {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff9C2CF3), Color(0xff3A49F9)],
                begin: const FractionalOffset(1.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                tileMode: TileMode.clamp),
            borderRadius: BorderRadius.all(Radius.circular(40))),
        child: TextButton(
          onPressed: () {},
          child: const Center(
            child: Text(
              'Create task',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ));
  }
}

class Form extends StatefulWidget {
  Form({Key? key}) : super(key: key);

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  var name = TextEditingController();
  var date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<Null> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          initialDatePickerMode: DatePickerMode.day,
          firstDate: DateTime(2015),
          lastDate: DateTime(2101));
      if (picked != null)
        setState(() {
          date.text = DateFormat.yMd().format(picked);
        });
    }

    return Column(
      children: [
        TextFormField(
          controller: name,
          style: const TextStyle(color: Colors.white, fontSize: 30),
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            labelText: "Name",
            fillColor: Colors.white,
            labelStyle:
                TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 3),
          ),
        ),
        SizedBox(
          height: 14,
        ),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: TextFormField(
            enabled: false,
            controller: date,
            style: const TextStyle(color: Colors.white, fontSize: 30),
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              labelText: "Date",
              fillColor: Colors.white,
              labelStyle: TextStyle(
                  color: Colors.white, fontSize: 20, letterSpacing: 3),
            ),
          ),
        )
      ],
    );
  }
}

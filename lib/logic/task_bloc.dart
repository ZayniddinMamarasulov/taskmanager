import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taskmanager/data/sqlHelper.dart';

import '../model/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {

  TaskBloc() : super(TaskInitial()) {
    on<CreateTaskButtonPressed> ((event,emit) async{
       emit(TaskLoadingState());
       await SqlHelper().insertTask(event.task);
       emit(AddTaskState());
    });
    on<LoadTaskEvent>((event,emit) async{
      emit(TaskLoadingState());
      List<Task> taskList= await SqlHelper().tasks();
      emit(TaskLoadedState(tasks: taskList));
    });

  }

}

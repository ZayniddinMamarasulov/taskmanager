part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();
}

class TaskInitial extends TaskState {
  @override
  List<Object> get props => [];
}
class TaskLoadedState extends TaskState{
  List<Task> tasks;
  TaskLoadedState({required this.tasks});
  @override
  List<Object?> get props => [tasks];

}
class TaskLoadingState extends TaskState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class AddTaskState extends TaskState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

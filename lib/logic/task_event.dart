part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}
class CreateTaskButtonPressed extends TaskEvent{
  Task task;
  CreateTaskButtonPressed(
  {required this.task});
  @override
  // TODO: implement props
  List<Object?> get props => [task];

}
class LoadTaskEvent extends TaskEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable{
const HomeEvent();
@override

  List<Object?> get props => [];
}

class TriggerListenEvent extends HomeEvent{}
class TriggerRecordEvent extends HomeEvent{}
class TriggerSendAudio extends HomeEvent{}
class TriggerStopAudio extends HomeEvent{}
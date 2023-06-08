part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent extends Equatable {}

class LoadRegisterEvent extends RegisterEvent {
  final Map requestData;
  LoadRegisterEvent(this.requestData);

  @override
  List<Object> get props => [requestData];
}

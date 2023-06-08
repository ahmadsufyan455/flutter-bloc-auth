part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {}

class LoadLoginEvent extends LoginEvent {
  final Map requestData;
  LoadLoginEvent(this.requestData);

  @override
  List<Object?> get props => [requestData];
}

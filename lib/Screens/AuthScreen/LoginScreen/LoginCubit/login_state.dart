part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoadingLoginState extends LoginState {}
final class errorLoadingState extends LoginState {
  final error;
  errorLoadingState (this.error);
}
final class SuccessLoginState  extends LoginState {}

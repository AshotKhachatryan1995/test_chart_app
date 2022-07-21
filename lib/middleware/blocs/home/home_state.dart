import 'package:equatable/equatable.dart';
import 'package:test_chart_project/middleware/models/user.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends HomeState {}

class LoadingState extends HomeState {}

class UsersSuccessfullyLoadedState extends HomeState {
  UsersSuccessfullyLoadedState({required this.users});
  final List<User> users;

  @override
  List<Object> get props => [users];
}

class UsersLoadFailedState extends HomeState {}

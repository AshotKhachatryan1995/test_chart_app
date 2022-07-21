import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_chart_project/middleware/blocs/home/home_event.dart';
import 'package:test_chart_project/middleware/blocs/home/home_state.dart';
import 'package:test_chart_project/middleware/models/api_error_model.dart';
import 'package:test_chart_project/middleware/models/user.dart';
import 'package:test_chart_project/middleware/repositories/api_repository_impl.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._apiRepositoryImpl) : super(InitialState()) {
    on<LoadUsersEvent>(_onLoadUsersEvent);
  }

  final ApiRepositoryImpl _apiRepositoryImpl;

  Future<void> _onLoadUsersEvent(
      LoadUsersEvent event, Emitter<HomeState> emit) async {
    emit(LoadingState());
    final result = await _apiRepositoryImpl.loadUsers();

    if (result is List<User>) {
      emit(UsersSuccessfullyLoadedState(users: result));
      return;
    }

    if (result is ApiErrorModel) {
      emit(UsersLoadFailedState());
      throw Exception(
          'Error code is: ${result.statusCode} and error message is : ${result.errorMessage}');
    }

    emit(InitialState());
  }
}

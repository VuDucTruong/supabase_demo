part of 'get_user_bloc.dart';

@immutable
sealed class GetUserState {}

final class GetUserInitial extends GetUserState {}

class GetUserLoadingState extends GetUserState {}

class GetUserLoadedState extends GetUserState {
  List<UserEntity> userList;

  GetUserLoadedState(this.userList);
}

class GetUserErrorState extends GetUserState {
  Failure failure;

  GetUserErrorState(this.failure);
}

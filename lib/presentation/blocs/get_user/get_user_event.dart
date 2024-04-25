part of 'get_user_bloc.dart';

@immutable
sealed class GetUserEvent {}


class GetUserButtonPressed extends GetUserEvent {}
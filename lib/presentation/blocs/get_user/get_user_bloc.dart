import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_demo/data/network/failure.dart';
import 'package:supabase_demo/domain/entity/user_entity.dart';
import 'package:supabase_demo/domain/usecase/get_user_usecase.dart';

part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  GetUserUseCase getUserUseCase;

  GetUserBloc(this.getUserUseCase) : super(GetUserInitial()) {
    on<GetUserButtonPressed>(_onGetUserButtonPressed);
  }

  FutureOr<void> _onGetUserButtonPressed(
      GetUserButtonPressed event, Emitter<GetUserState> emit) async {
    emit(GetUserLoadingState());
    (await getUserUseCase.execute(null)).fold((l) {
      print(l);
      emit(GetUserErrorState(l));
    }, (r) {
      print('Hello');
      emit(GetUserLoadedState(r));
    });
  }
}

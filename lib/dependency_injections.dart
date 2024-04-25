import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:supabase_demo/data/data_source/user_remote_data_source.dart';
import 'package:supabase_demo/data/network/network_info.dart';
import 'package:supabase_demo/data/repository/user_repository_impl.dart';
import 'package:supabase_demo/domain/usecase/get_user_usecase.dart';
import 'package:supabase_demo/presentation/blocs/get_user/get_user_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'domain/repository/user_repository.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  SupabaseClient supabase = Supabase.instance.client;

  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
  instance.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDateSouceImpl(supabase));
  instance.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(instance(), instance()));
  instance
      .registerLazySingleton<GetUserUseCase>(() => GetUserUseCase(instance()));
  instance.registerLazySingleton<GetUserBloc>(() => GetUserBloc(instance()));
}

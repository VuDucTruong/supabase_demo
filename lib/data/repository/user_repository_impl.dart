import 'package:dartz/dartz.dart';
import 'package:supabase_demo/data/data_source/user_remote_data_source.dart';
import 'package:supabase_demo/data/mapper/mapper.dart';
import 'package:supabase_demo/data/network/failure.dart';
import 'package:supabase_demo/data/network/network_info.dart';
import 'package:supabase_demo/domain/entity/user_entity.dart';
import 'package:supabase_demo/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRemoteDataSource userRemoteDataSource;
  NetworkInfo networkInfo;

  UserRepositoryImpl(this.userRemoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers() async {
    try {
      if (await networkInfo.isConnected) {
        final result = await userRemoteDataSource.getUser();
        return Right(result.map((e) => e.toEntity()).toList());
      } else {
        return Left(Failure('No internet connection!'));
      }
    } catch (exception) {
      return Left(Failure(exception.toString()));
    }
  }
}

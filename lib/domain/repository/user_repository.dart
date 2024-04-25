import 'package:dartz/dartz.dart';
import 'package:supabase_demo/data/network/failure.dart';
import 'package:supabase_demo/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure , List<UserEntity>>> getUsers();
}

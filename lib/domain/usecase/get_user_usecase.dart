import 'package:dartz/dartz.dart';
import 'package:supabase_demo/data/network/failure.dart';
import 'package:supabase_demo/domain/entity/user_entity.dart';
import 'package:supabase_demo/domain/repository/user_repository.dart';
import 'package:supabase_demo/domain/usecase/base_usecase.dart';

class GetUserUseCase extends BaseUseCase<void , List<UserEntity>> {
  UserRepository userRepository;


  GetUserUseCase(this.userRepository);

  @override
  Future<Either<Failure, List<UserEntity>>> execute(void input) async {
    return await userRepository.getUsers();
  }
}
import 'package:dartz/dartz.dart';
import 'package:supabase_demo/data/network/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
import 'package:supabase_demo/data/responses/user_response.dart';
import 'package:supabase_demo/domain/entity/user_entity.dart';

extension UserResponseMapper on UserResponse {
  UserEntity toEntity() {
    return UserEntity(id , title , address);
  }
}
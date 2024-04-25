import 'package:supabase_demo/data/responses/user_response.dart' as user;
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserRemoteDataSource {
  Future<List<user.UserResponse>> getUser();
}

class UserRemoteDateSouceImpl implements UserRemoteDataSource {
  SupabaseClient supabase;

  UserRemoteDateSouceImpl(this.supabase);

  @override
  Future<List<user.UserResponse>> getUser() async {
    try {
      List<user.UserResponse> userList = (await supabase.from('User').select())
          .map((e) => user.UserResponse.fromJson(e))
          .toList();
      if (userList.isEmpty) {
        throw Exception('There is no users !');
      }
      return userList;
    } catch (ex) {
      rethrow;
    }
  }
}

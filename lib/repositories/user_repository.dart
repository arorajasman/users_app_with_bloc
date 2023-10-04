import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:users_app_with_bloc/models/user_model.dart';

class UserRepository {
  String userUrl = 'https://reqres.in/api/users?page=2';

  Future<List<UserModel>> getUsers() async {
    http.Response response = await http.get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromMap(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/posts_data_model.dart';

class ApiServices {
  String endpoint = "https://jsonplaceholder.typicode.com/posts";

  Future<List<PostsData>> getPosts() async {
    Response responses = await get(Uri.parse(endpoint));
    if (responses.statusCode == 200) {
      final List results = jsonDecode(responses.body);
      return results.map(((e) => PostsData.fromJson(e))).toList();
    } else {
      throw Exception(responses.reasonPhrase);
    }
  }
}

final postProvider = Provider<ApiServices>((ref) => ApiServices());

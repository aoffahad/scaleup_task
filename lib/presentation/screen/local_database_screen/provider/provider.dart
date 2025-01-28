import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/datasource/local/posts_local_database.dart';
import '../../../../data/model/posts_data_model.dart';

final postsProvider = FutureProvider<List<PostsData>>((ref) async {
  final db = await SQLHelper.db();
  final List<Map<String, dynamic>> results = await db.query('items');
  return results.map((e) => PostsData.fromJson(e)).toList();
});

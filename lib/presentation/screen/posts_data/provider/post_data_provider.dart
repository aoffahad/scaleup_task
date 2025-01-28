import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/datasource/remote/service.dart';
import '../../../../data/model/posts_data_model.dart';

final postDataProvider = FutureProvider<List<PostsData>>((ref) async {
  return ref.watch(postProvider).getPosts();
});

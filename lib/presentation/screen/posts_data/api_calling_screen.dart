import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scaleup_task/presentation/screen/posts_data/provider/post_data_provider.dart';

import '../../../data/model/posts_data_model.dart';

class ApiCallingScreen extends ConsumerWidget {
  const ApiCallingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(postDataProvider);

    return Scaffold(
      backgroundColor: const Color(0xff11161f),
      appBar: AppBar(
        title: const Text('Data From API'),
        centerTitle: true,
      ),
      body: data.when(
        data: (data) {
          List<PostsData> postList = data.map((e) => e).toList();

          return RefreshIndicator(
            color: Colors.white,
            backgroundColor: Colors.grey,
            strokeWidth: 3.0,
            onRefresh: () async {
              ref.invalidate(postDataProvider);
              await Future.delayed(const Duration(seconds: 1));
            },
            child: ListView.builder(
              itemCount: postList.length,
              itemBuilder: (_, index) {
                final post = postList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      title: Text(
                        post.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        post.body,
                        style: const TextStyle(color: Colors.white),
                      ),
                      leading: Text(
                        'ID: ${post.id}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
        error: (error, stackTrace) => Center(
          child: Text(
            'Error: $error',
            style: const TextStyle(color: Colors.red),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

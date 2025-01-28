import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scaleup_task/presentation/screen/posts_data/provider/post_data_provider.dart';

import '../../../data/model/posts_data_model.dart';

class ApiCallingScreen extends ConsumerWidget {
  const ApiCallingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(postDataProvider);
    print(data);
    return Scaffold(
      backgroundColor: Colors.black,
      body: data.when(
        data: (data) {
          List<PostsData> postList = data.map((e) => e).toList();
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: ListTile(
                            title: Text(
                              data[index].title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ), // Display the title
                            subtitle: Text(data[index].body,
                                style: const TextStyle(
                                    color: Colors.white)), // Display the body
                            leading: Text('ID: ${data[index].id}',
                                style: const TextStyle(
                                    color:
                                        Colors.white)), // Example: Display ID
                          ),
                        ),
                      );
                    }),
              )
            ],
          );
        },
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

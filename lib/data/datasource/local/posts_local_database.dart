import 'package:scaleup_task/data/model/posts_data_model.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    userId INTEGER,
    title TEXT,
    body TEXT
  )""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('aoffahad', version: 1,
        onCreate: (sql.Database database, int version) async {
      print("...creating a table...");
      await createTables(database);
    });
  }

  Future<void> insertPost(List<PostsData> postData) async {
    try {
      // Get the database instance using the db() method
      final db = await SQLHelper.db();

      // Clear the table before inserting new data
      await db.delete('items');

      // Prepare batch for bulk insert
      Batch batch = db.batch();

      for (var post in postData) {
        batch.insert('items', {
          'userId': post.userId,
          'title': post.title,
          'body': post.body,
        });
      }

      // Commit the batch
      await batch.commit(noResult: true);
      print("Posts inserted successfully");
    } catch (e) {
      print("Error inserting posts: $e");
    }
  }
}

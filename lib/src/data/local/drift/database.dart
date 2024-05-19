import 'package:drift/drift.dart';

// ignore: unused_import
import 'tables/tables.dart';

import 'connection/connection.dart' as impl;

part '../../../../generated/src/data/local/drift/database.g.dart';

@DriftDatabase(
  tables: [
    TodoItem,
    TodoCategory,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(impl.connect());

  AppDatabase.forTesting(DatabaseConnection connection) : super(connection);

  @override
  int get schemaVersion => 1;
}

import 'package:drift/drift.dart';

// @DataClassName('TodoCategory')
class TodoCategory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
}

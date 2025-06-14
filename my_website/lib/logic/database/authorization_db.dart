// import 'package:drift/drift.dart';
// import 'package:drift/web.dart';
// import 'package:drift/native.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;
// import 'dart:io';
// import 'package:flutter/foundation.dart' show kIsWeb;
//
// part 'authorization_db.g.dart';
//
// class Users extends Table {
// IntColumn get id => integer().autoIncrement()();
// TextColumn get name => text()();
// TextColumn get phoneNumber => text()();
// }
//
// @DriftDatabase(tables: [Users])
// class AppDatabase extends _$AppDatabase {
// AppDatabase() : super(_openConnection());
//
// @override
// int get schemaVersion => 1;
//
// // متد برای درج کاربر جدید
// Future<int> insertUser(UsersCompanion user) => into(users).insert(user);
//
// // متد برای دریافت همه کاربران
// Future<List<User>> getAllUsers() => select(users).get();
// }
//
// QueryExecutor _openConnection() {
// if (kIsWeb) {
// // برای وب از WebDatabase استفاده می‌کنیم
// return WebDatabase('app_database');
// } else {
// // برای پلتفرم‌های بومی از NativeDatabase
// return LazyDatabase(() async {
// final dbFolder = await getApplicationDocumentsDirectory();
// final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
// return NativeDatabase(file);
// });
// }
// }

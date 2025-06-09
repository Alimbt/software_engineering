// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'authorization_db.dart';
//
// // ignore_for_file: type=lint
// class $UsersTable extends Users with TableInfo<$UsersTable, User> {
//   @override
//   final GeneratedDatabase attachedDatabase;
//   final String? _alias;
//   $UsersTable(this.attachedDatabase, [this._alias]);
//   static const VerificationMeta _idMeta = const VerificationMeta('id');
//   @override
//   late final GeneratedColumn<int> id = GeneratedColumn<int>(
//       'id', aliasedName, false,
//       hasAutoIncrement: true,
//       type: DriftSqlType.int,
//       requiredDuringInsert: false,
//       defaultConstraints:
//           GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
//   static const VerificationMeta _nameMeta = const VerificationMeta('name');
//   @override
//   late final GeneratedColumn<String> name = GeneratedColumn<String>(
//       'name', aliasedName, false,
//       type: DriftSqlType.string, requiredDuringInsert: true);
//   static const VerificationMeta _phoneNumberMeta =
//       const VerificationMeta('phoneNumber');
//   @override
//   late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
//       'phone_number', aliasedName, false,
//       type: DriftSqlType.string, requiredDuringInsert: true);
//   @override
//   List<GeneratedColumn> get $columns => [id, name, phoneNumber];
//   @override
//   String get aliasedName => _alias ?? actualTableName;
//   @override
//   String get actualTableName => $name;
//   static const String $name = 'users';
//   @override
//   VerificationContext validateIntegrity(Insertable<User> instance,
//       {bool isInserting = false}) {
//     final context = VerificationContext();
//     final data = instance.toColumns(true);
//     if (data.containsKey('id')) {
//       context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
//     }
//     if (data.containsKey('name')) {
//       context.handle(
//           _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
//     } else if (isInserting) {
//       context.missing(_nameMeta);
//     }
//     if (data.containsKey('phone_number')) {
//       context.handle(
//           _phoneNumberMeta,
//           phoneNumber.isAcceptableOrUnknown(
//               data['phone_number']!, _phoneNumberMeta));
//     } else if (isInserting) {
//       context.missing(_phoneNumberMeta);
//     }
//     return context;
//   }
//
//   @override
//   Set<GeneratedColumn> get $primaryKey => {id};
//   @override
//   User map(Map<String, dynamic> data, {String? tablePrefix}) {
//     final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
//     return User(
//       id: attachedDatabase.typeMapping
//           .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
//       name: attachedDatabase.typeMapping
//           .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
//       phoneNumber: attachedDatabase.typeMapping
//           .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
//     );
//   }
//
//   @override
//   $UsersTable createAlias(String alias) {
//     return $UsersTable(attachedDatabase, alias);
//   }
// }
//
// class User extends DataClass implements Insertable<User> {
//   final int id;
//   final String name;
//   final String phoneNumber;
//   const User({required this.id, required this.name, required this.phoneNumber});
//   @override
//   Map<String, Expression> toColumns(bool nullToAbsent) {
//     final map = <String, Expression>{};
//     map['id'] = Variable<int>(id);
//     map['name'] = Variable<String>(name);
//     map['phone_number'] = Variable<String>(phoneNumber);
//     return map;
//   }
//
//   UsersCompanion toCompanion(bool nullToAbsent) {
//     return UsersCompanion(
//       id: Value(id),
//       name: Value(name),
//       phoneNumber: Value(phoneNumber),
//     );
//   }
//
//   factory User.fromJson(Map<String, dynamic> json,
//       {ValueSerializer? serializer}) {
//     serializer ??= driftRuntimeOptions.defaultSerializer;
//     return User(
//       id: serializer.fromJson<int>(json['id']),
//       name: serializer.fromJson<String>(json['name']),
//       phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
//     );
//   }
//   @override
//   Map<String, dynamic> toJson({ValueSerializer? serializer}) {
//     serializer ??= driftRuntimeOptions.defaultSerializer;
//     return <String, dynamic>{
//       'id': serializer.toJson<int>(id),
//       'name': serializer.toJson<String>(name),
//       'phoneNumber': serializer.toJson<String>(phoneNumber),
//     };
//   }
//
//   User copyWith({int? id, String? name, String? phoneNumber}) => User(
//         id: id ?? this.id,
//         name: name ?? this.name,
//         phoneNumber: phoneNumber ?? this.phoneNumber,
//       );
//   User copyWithCompanion(UsersCompanion data) {
//     return User(
//       id: data.id.present ? data.id.value : this.id,
//       name: data.name.present ? data.name.value : this.name,
//       phoneNumber:
//           data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
//     );
//   }
//
//   @override
//   String toString() {
//     return (StringBuffer('User(')
//           ..write('id: $id, ')
//           ..write('name: $name, ')
//           ..write('phoneNumber: $phoneNumber')
//           ..write(')'))
//         .toString();
//   }
//
//   @override
//   int get hashCode => Object.hash(id, name, phoneNumber);
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       (other is User &&
//           other.id == this.id &&
//           other.name == this.name &&
//           other.phoneNumber == this.phoneNumber);
// }
//
// class UsersCompanion extends UpdateCompanion<User> {
//   final Value<int> id;
//   final Value<String> name;
//   final Value<String> phoneNumber;
//   const UsersCompanion({
//     this.id = const Value.absent(),
//     this.name = const Value.absent(),
//     this.phoneNumber = const Value.absent(),
//   });
//   UsersCompanion.insert({
//     this.id = const Value.absent(),
//     required String name,
//     required String phoneNumber,
//   })  : name = Value(name),
//         phoneNumber = Value(phoneNumber);
//   static Insertable<User> custom({
//     Expression<int>? id,
//     Expression<String>? name,
//     Expression<String>? phoneNumber,
//   }) {
//     return RawValuesInsertable({
//       if (id != null) 'id': id,
//       if (name != null) 'name': name,
//       if (phoneNumber != null) 'phone_number': phoneNumber,
//     });
//   }
//
//   UsersCompanion copyWith(
//       {Value<int>? id, Value<String>? name, Value<String>? phoneNumber}) {
//     return UsersCompanion(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       phoneNumber: phoneNumber ?? this.phoneNumber,
//     );
//   }
//
//   @override
//   Map<String, Expression> toColumns(bool nullToAbsent) {
//     final map = <String, Expression>{};
//     if (id.present) {
//       map['id'] = Variable<int>(id.value);
//     }
//     if (name.present) {
//       map['name'] = Variable<String>(name.value);
//     }
//     if (phoneNumber.present) {
//       map['phone_number'] = Variable<String>(phoneNumber.value);
//     }
//     return map;
//   }
//
//   @override
//   String toString() {
//     return (StringBuffer('UsersCompanion(')
//           ..write('id: $id, ')
//           ..write('name: $name, ')
//           ..write('phoneNumber: $phoneNumber')
//           ..write(')'))
//         .toString();
//   }
// }
//
// abstract class _$AppDatabase extends GeneratedDatabase {
//   _$AppDatabase(QueryExecutor e) : super(e);
//   $AppDatabaseManager get managers => $AppDatabaseManager(this);
//   late final $UsersTable users = $UsersTable(this);
//   @override
//   Iterable<TableInfo<Table, Object?>> get allTables =>
//       allSchemaEntities.whereType<TableInfo<Table, Object?>>();
//   @override
//   List<DatabaseSchemaEntity> get allSchemaEntities => [users];
// }
//
// typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
//   Value<int> id,
//   required String name,
//   required String phoneNumber,
// });
// typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
//   Value<int> id,
//   Value<String> name,
//   Value<String> phoneNumber,
// });
//
// class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
//   $$UsersTableFilterComposer({
//     required super.$db,
//     required super.$table,
//     super.joinBuilder,
//     super.$addJoinBuilderToRootComposer,
//     super.$removeJoinBuilderFromRootComposer,
//   });
//   ColumnFilters<int> get id => $composableBuilder(
//       column: $table.id, builder: (column) => ColumnFilters(column));
//
//   ColumnFilters<String> get name => $composableBuilder(
//       column: $table.name, builder: (column) => ColumnFilters(column));
//
//   ColumnFilters<String> get phoneNumber => $composableBuilder(
//       column: $table.phoneNumber, builder: (column) => ColumnFilters(column));
// }
//
// class $$UsersTableOrderingComposer
//     extends Composer<_$AppDatabase, $UsersTable> {
//   $$UsersTableOrderingComposer({
//     required super.$db,
//     required super.$table,
//     super.joinBuilder,
//     super.$addJoinBuilderToRootComposer,
//     super.$removeJoinBuilderFromRootComposer,
//   });
//   ColumnOrderings<int> get id => $composableBuilder(
//       column: $table.id, builder: (column) => ColumnOrderings(column));
//
//   ColumnOrderings<String> get name => $composableBuilder(
//       column: $table.name, builder: (column) => ColumnOrderings(column));
//
//   ColumnOrderings<String> get phoneNumber => $composableBuilder(
//       column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));
// }
//
// class $$UsersTableAnnotationComposer
//     extends Composer<_$AppDatabase, $UsersTable> {
//   $$UsersTableAnnotationComposer({
//     required super.$db,
//     required super.$table,
//     super.joinBuilder,
//     super.$addJoinBuilderToRootComposer,
//     super.$removeJoinBuilderFromRootComposer,
//   });
//   GeneratedColumn<int> get id =>
//       $composableBuilder(column: $table.id, builder: (column) => column);
//
//   GeneratedColumn<String> get name =>
//       $composableBuilder(column: $table.name, builder: (column) => column);
//
//   GeneratedColumn<String> get phoneNumber => $composableBuilder(
//       column: $table.phoneNumber, builder: (column) => column);
// }
//
// class $$UsersTableTableManager extends RootTableManager<
//     _$AppDatabase,
//     $UsersTable,
//     User,
//     $$UsersTableFilterComposer,
//     $$UsersTableOrderingComposer,
//     $$UsersTableAnnotationComposer,
//     $$UsersTableCreateCompanionBuilder,
//     $$UsersTableUpdateCompanionBuilder,
//     (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
//     User,
//     PrefetchHooks Function()> {
//   $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
//       : super(TableManagerState(
//           db: db,
//           table: table,
//           createFilteringComposer: () =>
//               $$UsersTableFilterComposer($db: db, $table: table),
//           createOrderingComposer: () =>
//               $$UsersTableOrderingComposer($db: db, $table: table),
//           createComputedFieldComposer: () =>
//               $$UsersTableAnnotationComposer($db: db, $table: table),
//           updateCompanionCallback: ({
//             Value<int> id = const Value.absent(),
//             Value<String> name = const Value.absent(),
//             Value<String> phoneNumber = const Value.absent(),
//           }) =>
//               UsersCompanion(
//             id: id,
//             name: name,
//             phoneNumber: phoneNumber,
//           ),
//           createCompanionCallback: ({
//             Value<int> id = const Value.absent(),
//             required String name,
//             required String phoneNumber,
//           }) =>
//               UsersCompanion.insert(
//             id: id,
//             name: name,
//             phoneNumber: phoneNumber,
//           ),
//           withReferenceMapper: (p0) => p0
//               .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
//               .toList(),
//           prefetchHooksCallback: null,
//         ));
// }
//
// typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
//     _$AppDatabase,
//     $UsersTable,
//     User,
//     $$UsersTableFilterComposer,
//     $$UsersTableOrderingComposer,
//     $$UsersTableAnnotationComposer,
//     $$UsersTableCreateCompanionBuilder,
//     $$UsersTableUpdateCompanionBuilder,
//     (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
//     User,
//     PrefetchHooks Function()>;
//
// class $AppDatabaseManager {
//   final _$AppDatabase _db;
//   $AppDatabaseManager(this._db);
//   $$UsersTableTableManager get users =>
//       $$UsersTableTableManager(_db, _db.users);
// }

import 'dart:io';

import 'package:pr_2/common/data/model/polzovatel.dart';
import 'package:pr_2/common/data/model/category.dart';
import 'package:pr_2/common/data/model/cell.dart';
import 'package:pr_2/common/data/model/employee.dart';
import 'package:pr_2/common/data/model/zakaz.dart';
import 'package:pr_2/common/data/model/product.dart';
import 'package:pr_2/common/data/model/productInCellEntity.dart';
import 'package:pr_2/common/data/model/provider.dart';
import 'package:pr_2/common/data/model/role.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../../common/data_base_request.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;
  late final String _pathDB;
  late final Database dataBase;
  int _version = 1;

  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'postavka.db');

    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      sqfliteFfiInit();
      dataBase = await databaseFactoryFfi.openDatabase(
        _pathDB,
        options: OpenDatabaseOptions(
          version: _version,
          onCreate: (db, version) async {
            await onCreateTable(db);
          },
          onUpgrade: (db, oldVersion, newVersion) async {
            await onUpdateTable(db);
          },
        ),
      );
    } else {
      dataBase = await openDatabase(_pathDB, version: _version,
          onCreate: (dataBase, version) async {
        await onCreateTable(dataBase);
      }, onUpgrade: (dataBase, oldVersion, newVersion) async {
        await onUpdateTable(dataBase);
      });
    }
  }

  Future<void> onCreateTable(Database db) async {
    for (var i = 0; i < DataBaseRequest.tableList.length; i++) {
      await db.execute(DataBaseRequest.createTableList[i]);
    }
    await onInitTable(db);
  }

  Future<void> onDropDataBase() async {
    dataBase.close();
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      databaseFactoryFfi.deleteDatabase(_pathDB);
    } else {
      deleteDatabase(_pathDB);
    }
  }

  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery('Select name From sqlite_master;');

    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element['name'] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }
    for (var i = 0; i < DataBaseRequest.tableList.length; i++) {
      await db.execute(DataBaseRequest.createTableList[i]);
    }
    await onInitTable(db);
  }

  Future<void> onInitTable(Database db) async {
    try {
      db.insert(
          DataBaseRequest.tableRole,
          Role(
            roleName: 'Admin',
          ).toMap());
      db.insert(
          DataBaseRequest.tableRole,
          Role(
            roleName: 'User',
          ).toMap());

      db.insert(
          DataBaseRequest.tableAccount,
          Polzovatel(
            login: 'Islam',
            password: '1234',
            roleId: 1,
          ).toMap());

      db.insert(
          DataBaseRequest.tableEmployee,
          Employee(
                  surname: 'surname',
                  name: 'name',
                  patronymic: 'patronymic',
                  accountId: 1)
              .toMap());

      db.insert(
          DataBaseRequest.tableCategory,
          Category(
            categoryName: 'Topez',
          ).toMap());

      db.insert(
          DataBaseRequest.tableProvider,
          Provider(
            providerName: 'DND',
            phone: '89083783938',
          ).toMap());

      db.insert(
          DataBaseRequest.tableProduct,
          Product(
                  productName: 'pochka',
                  description: '-',
                  providerId: 1,
                  categoryId: 1,
                  price: 9999,
                  count: 76)
              .toMap());
      db.insert(
          DataBaseRequest.tableCell,
          Cell(
            cellName: 'cellName',
            row: 10,
            column: 10,
          ).toMap());
      db.insert(
          DataBaseRequest.tableProductInCell,
          ProductInCell(
            productId: 1,
            cellId: 1,
          ).toMap());
      db.insert(
          DataBaseRequest.tableOrder,
          Zakaz(
            employeeId: 1,
            productId: 1,
            date: DateTime.now().toString(),
            count: 69,
          ).toMap());
    } on DatabaseException catch (e) {}
  }
}

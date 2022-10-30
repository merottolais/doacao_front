import 'dart:io';

import 'package:doacao_front/models/donation_model.dart';
import 'package:objectdb/objectdb.dart';
import 'package:objectdb/src/objectdb_storage_indexeddb.dart';

class DonationDatabase {
  final db = ObjectDB(
    IndexedDBStorage(Directory.current.path + '/donation.db'),
  );

  Future<void> insert(Donation donation) async {
    await db.insert(donation.toJson());
  }

  /*
  final path = Directory.current.path + '/my.db';

// create database instance and open
final db = ObjectDB(FileSystemStorage(path));

// insert document into database
db.insert({'name': {'first': 'Some', 'last': 'Body'}, 'age': 18, 'active': true});
db.insert({'name': {'first': 'Someone', 'last': 'Else'}, 'age': 25, 'active': false});

// update documents
db.update({Op.gte: {'age': 80}}, {'active': false});

// remove documents
db.remove({'active': false});

// search documents in database
var result = await db.find({'active': true, 'name.first': 'Some'});

// cleanup the db file
db.cleanup();

// close db
await db.close();
  */
}

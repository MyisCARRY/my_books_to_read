import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:my_books_to_read/features/books/domain/models/book.dart';
import 'package:my_books_to_read/features/database/data/datasources/database_datasource.dart';

class FirestoreDatasource extends DatabaseDatasource {
  FirestoreDatasource({
    required this.client,
    required this.deviceInfo,
  });

  final FirebaseFirestore client;
  final DeviceInfoPlugin deviceInfo;

  @override
  Future<List<Book>> getFavoriteBooks() async {
    final String deviceId = await _getDeviceId();
    final collection = client.collection('devices/$deviceId/favorite_books');
    final rawBooks = await collection.get();
    final books = rawBooks.docs.map((e) => Book.fromJson(e.data())).toList();

    return books.map((e) => e.copyWith(favorite: true)).toList();
  }

  @override
  Future<bool> addFavoriteBook(Book book) async {
    final String deviceId = await _getDeviceId();
    final collection = client.collection('devices/$deviceId/favorite_books');
    await collection.add(book.toJson());

    return true;
  }

  @override
  Future<bool> removeFavoriteBook(Book book) async {
    final String deviceId = await _getDeviceId();
    final collection = client.collection('devices/$deviceId/favorite_books');
    final czincz = await collection.where('id', isEqualTo: book.id).get();
    for (final doc in czincz.docs) {
      await client.runTransaction((transaction) async => transaction.delete(doc.reference));
    }

    return true;
  }

  Future<String> _getDeviceId() async {
    if (Platform.isIOS) {
      final info = await deviceInfo.iosInfo;
      final id = info.identifierForVendor;
      if (id == null) {
        throw Exception('Device ID is null');
      } else {
        return id;
      }
    } else if (Platform.isAndroid) {
      final info = await deviceInfo.androidInfo;
      return info.id;
    } else {
      throw UnimplementedError();
    }
  }
}

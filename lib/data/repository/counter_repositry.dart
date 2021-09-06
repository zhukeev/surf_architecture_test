import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:surf_architecture_test/data/storage/local_storage.dart';

class CounterRepository {
  final LocalStorage _hive;

  CounterRepository(this._hive);

  Future<void> changeCounter(int value, int index) => _hive.set(value, index);

  int getCounter(int index) => _hive.get(index);

  Future<void> addCounter() => _hive.addCounter();

  ValueListenable<Box<int>> listenable({List<int>? keys}) {
    return _hive.listenable(keys: keys);
  }
}

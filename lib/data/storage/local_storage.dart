import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorage {
  final Box<int> hive;

  LocalStorage(this.hive) {
    if (!hive.containsKey(0)) {
      hive.put(0, 0);
    }
  }

  Future<void> set(int value, int index) => hive.putAt(index, value);

  int get(int index, [int defaultValue = 0]) =>
      hive.getAt(index) ?? defaultValue;

  Future<int> addCounter() => hive.add(0);

  ValueListenable<Box<int>> listenable({List<int>? keys}) {
    return hive.listenable(keys: keys);
  }
}

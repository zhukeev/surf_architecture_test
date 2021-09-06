import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mwwm/mwwm.dart';
import 'package:surf_architecture_test/data/repository/counter_repositry.dart';

/// Counter screen's widget model
// ignore: prefer_mixin
class CounterListWidgetModel extends WidgetModel {
  final CounterRepository _counterRepository;

  CounterListWidgetModel(
    this._counterRepository,
  ) : super(WidgetModelDependencies());

  ValueListenable<Box<int>> listenableValue({List<int>? keys}) =>
      _counterRepository.listenable(keys: keys);

  void addCounter() {
    _counterRepository.addCounter();
  }
}

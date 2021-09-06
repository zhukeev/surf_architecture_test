import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mwwm/mwwm.dart';
import 'package:surf_architecture_test/data/repository/counter_repositry.dart';

/// Counter screen's widget model
// ignore: prefer_mixin
class CounterWidgetModel extends WidgetModel with ChangeNotifier {
  final CounterRepository _counterRepository;

  CounterWidgetModel(
    this._counterRepository,
  ) : super(WidgetModelDependencies());

  @override
  void onLoad() {
    super.onLoad();
  }

  void increment(int index) {
    final lastVal = _counterRepository.getCounter(index);
    _counterRepository.changeCounter(
      lastVal + 1,
      index,
    );
  }

  ValueListenable<Box<int>> listenableValue({List<int>? keys}) =>
      _counterRepository.listenable(keys: keys);

  void addCounter() {
    _counterRepository.addCounter();
  }
}

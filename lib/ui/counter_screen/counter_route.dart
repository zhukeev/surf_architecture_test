import 'package:flutter/material.dart';
import 'package:surf_architecture_test/ui/app/app_component.dart';
import 'package:surf_injector/surf_injector.dart';
import 'counter_screen.dart';
import 'counter_wm.dart';

/// Route for [CounterScreen]
class CounterScreenRoute<T> extends MaterialPageRoute<T> {
  final int index;
  CounterScreenRoute({required this.index})
      : super(
          builder: (context) => CounterScreen(
            widgetModelBuilder: _createCounterWm,
            index: index,
          ),
        );
}

/// Dependencies for [CounterWidgetModel]
CounterWidgetModel _createCounterWm(BuildContext context) {
  return CounterWidgetModel(
      Injector.of<AppComponent>(context).component.animeRepository);
}

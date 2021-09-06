import 'package:flutter/material.dart';
import 'package:surf_architecture_test/ui/app/app_component.dart';
import 'package:surf_injector/surf_injector.dart';

import 'counter_list_screen.dart';
import 'counter_wm.dart';

/// Route for [CounterListScreen]
class CounterListScreenRoute<T> extends MaterialPageRoute<T> {
  CounterListScreenRoute()
      : super(
          builder: (context) => CounterListScreen(
            widgetModelBuilder: _createListCounterWm,
          ),
        );
}

/// Dependencies for [CounterListWidgetModel]
CounterListWidgetModel _createListCounterWm(BuildContext context) {
  return CounterListWidgetModel(
      Injector.of<AppComponent>(context).component.animeRepository);
}

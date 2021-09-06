import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mwwm/mwwm.dart';

import 'counter_wm.dart';

/// Counter's screen
class CounterScreen extends CoreMwwmWidget<CounterWidgetModel> {
  final int index;

  const CounterScreen({
    required this.index,
    required WidgetModelBuilder<CounterWidgetModel> widgetModelBuilder,
    Key? key,
  }) : super(key: key, widgetModelBuilder: widgetModelBuilder);

  @override
  WidgetState<CoreMwwmWidget<CounterWidgetModel>, CounterWidgetModel>
      createWidgetState() {
    return _CounterScreenState();
  }
}

class _CounterScreenState
    extends WidgetState<CounterScreen, CounterWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder<Box<int>>(
          valueListenable: wm.listenableValue(keys: [widget.index]),
          builder: (context, box, _) {
            return Text(
              '${box.getAt(widget.index)}',
              key: const Key('counter'),
              style: Theme.of(context).textTheme.headline6,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => wm.increment(widget.index),
        key: const Key('increment'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

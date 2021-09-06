import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mwwm/mwwm.dart';
import 'package:surf_architecture_test/ui/counter_screen/counter_route.dart';

import 'counter_wm.dart';

/// Counter's screen
class CounterListScreen extends CoreMwwmWidget<CounterListWidgetModel> {
  const CounterListScreen({
    required WidgetModelBuilder<CounterListWidgetModel> widgetModelBuilder,
    Key? key,
  }) : super(key: key, widgetModelBuilder: widgetModelBuilder);

  @override
  WidgetState<CoreMwwmWidget<CounterListWidgetModel>, CounterListWidgetModel>
      createWidgetState() {
    return _CounterScreenState();
  }
}

class _CounterScreenState
    extends WidgetState<CounterListScreen, CounterListWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter list'),
      ),
      body: Center(
        child: ValueListenableBuilder<Box<int>>(
          valueListenable: wm.listenableValue(),
          builder: (context, box, _) {
            final values = box.values;
            print(values);
            return ListView.separated(
                key: const Key('counter_list'),
                itemCount: values.length,
                separatorBuilder: (_, index) => Divider(
                      color: Colors.black38,
                    ),
                itemBuilder: (_, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(CounterScreenRoute(index: index));
                    },
                    title: Text(
                      '${values.elementAt(index)}',
                      key: ValueKey('$index'),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  );
                });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => wm.addCounter(),
        child: const Icon(Icons.add),
        key: const Key('add_counter_btn'),
      ),
    );
  }
}

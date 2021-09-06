import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:surf_architecture_test/ui/app.dart';
import 'package:surf_injector/surf_injector.dart';

import 'data/repository/counter_repositry.dart';
import 'data/storage/local_storage.dart';
import 'ui/app/app_component.dart';
import 'package:flutter_driver/driver_extension.dart';

final countersBoxKey = 'counters';

void main() async {
  enableFlutterDriverExtension();

  await Hive.initFlutter();
  final counterBox = await Hive.openBox<int>(countersBoxKey);

  runApp(
    Injector(
      component: AppComponent(CounterRepository(LocalStorage(counterBox))),
      builder: (_) => const App(),
    ),
  );
}

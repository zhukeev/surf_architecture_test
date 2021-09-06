import 'package:surf_architecture_test/data/repository/counter_repositry.dart';
import 'package:surf_injector/surf_injector.dart';

class AppComponent extends Component {
  AppComponent(this.animeRepository);

  final CounterRepository animeRepository;
}

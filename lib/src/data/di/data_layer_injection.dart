import 'module/helper_module.dart';
import 'module/local_module.dart';
import 'module/network_module.dart';
import 'module/repository_module.dart';

mixin DataLayerInjection {
  static Future<void> configureDataLayerInjection() async {
    await HelperModule.configureLocalModuleInjection();
    await LocalModule.configureLocalModuleInjection();
    await NetworkModule.configureNetworkModuleInjection();
    await RepositoryModule.configureRepositoryModuleInjection();
  }
}

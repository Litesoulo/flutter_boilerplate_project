import 'package:auto_route/auto_route.dart';

import '../../../presentation/home/home_screen.dart';
import '../../../presentation/login/login_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
        ),
      ];
}

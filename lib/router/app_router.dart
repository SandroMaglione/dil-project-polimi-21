import 'package:auto_route/auto_route.dart';
import 'package:dil/screens/assigned_screen.dart';
import 'package:dil/screens/confirm_screen.dart';
import 'package:dil/screens/order_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: OrderScreen, initial: true),
    AutoRoute(page: ConfirmScreen),
    AutoRoute(page: AssignedScreen),
  ],
)
class $AppRouter {}

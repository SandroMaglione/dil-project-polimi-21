// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../models/order_model.dart' as _i6;
import '../screens/assigned_screen.dart' as _i5;
import '../screens/confirm_screen.dart' as _i4;
import '../screens/order_screen.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    OrderRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.OrderScreen();
        }),
    ConfirmRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ConfirmRouteArgs>();
          return _i4.ConfirmScreen(args.order);
        }),
    AssignedRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.AssignedScreen();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(OrderRoute.name, path: '/'),
        _i1.RouteConfig(ConfirmRoute.name, path: '/confirm-screen'),
        _i1.RouteConfig(AssignedRoute.name, path: '/assigned-screen')
      ];
}

class OrderRoute extends _i1.PageRouteInfo {
  const OrderRoute() : super(name, path: '/');

  static const String name = 'OrderRoute';
}

class ConfirmRoute extends _i1.PageRouteInfo<ConfirmRouteArgs> {
  ConfirmRoute({required _i6.Order order})
      : super(name,
            path: '/confirm-screen', args: ConfirmRouteArgs(order: order));

  static const String name = 'ConfirmRoute';
}

class ConfirmRouteArgs {
  const ConfirmRouteArgs({required this.order});

  final _i6.Order order;
}

class AssignedRoute extends _i1.PageRouteInfo {
  const AssignedRoute() : super(name, path: '/assigned-screen');

  static const String name = 'AssignedRoute';
}

import 'package:always_listening/common/strings_manager.dart';
import 'package:always_listening/presentation_layer/transcript/view/transcript_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_configurations/app_environments.dart';
import '../di/di.dart';
import '../presentation_layer/home/view/home_view.dart';

class RouteName {
  //property owner
  static const String home_route = '/';
  static const String transcript_route = '/transcript-route';
}

class RoutesManager {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    // final Arguments args = routeSettings.arguments as Arguments;
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case RouteName.home_route:
        initHomeModule();
        return MaterialPageRoute(builder: (_) =>  HomeView());
      case RouteName.transcript_route:

        return MaterialPageRoute(builder: (_) => const TranscriptView());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text(AppEnvironments.appName),
          ),
          body: const Center(
            child: Text(StringsManager.default_route_message),
          ),
        ));
  }
}
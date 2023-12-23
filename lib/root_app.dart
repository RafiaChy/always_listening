import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_configurations/app_environments.dart';
import 'common/color_manager.dart';
import 'common/route_maneger.dart';
import 'di/di.dart';

Future<void>  mainDelegateForEnvironments() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  await ScreenUtil.ensureScreenSize();

  runApp( RootApp());
}


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final botToastBuilder = BotToastInit();
class RootApp extends StatefulWidget {
  const RootApp._internal();

  static const RootApp instance = RootApp._internal();

  factory RootApp() => instance;

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {


  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //ColorManager.white
      statusBarIconBrightness: Brightness.dark, // Brightness.light, /
      systemNavigationBarColor: ColorManager.colorAgainstDarkBg,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      theme: ThemeData(
        // you can decide app bar themes here
      ),
      debugShowCheckedModeBanner: AppEnvironments.debugBannerBoolean,
      builder: (ctx, child) {
        ScreenUtil.init(ctx);
        child = botToastBuilder(context, child);
        return ResponsiveBreakpoints.builder(
          child: child,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        );
      },
      initialRoute: RouteName.home_route,
      onGenerateRoute: RoutesManager.getRoute,
      title: AppEnvironments.appName,
      navigatorKey: navigatorKey,


    );
  }
}

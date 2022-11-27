import 'package:f4pg/pages/wallet_login/wallet_login.pages.dart';
import 'package:f4pg/providers/ops.provider.dart';
import 'package:f4pg/providers/theme.provider.dart';
import 'package:f4pg/providers/wallet.provider.dart';
import 'package:f4pg/providers/wallet_login.provider.dart';
import 'package:f4pg/widgets/bip24Search/bip24-search.widget.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


final GlobalKey<NavigatorState> _rootNavigatorKey =
 GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

/* ROUTING */
final GoRouter _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: <RouteBase>[
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) => WalletLoginPage()
    )
    /* need to add a wraper for nesting in, a nav bar */
    // ShellRoute(
    //   navigatorKey: _shellNavigatorKey,
    //   build
    // )
  ]
);

/* MAIN */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: ((context) => ThemeProvider()), 
      ),
      ChangeNotifierProvider(
        create: ((context) => WalletLoginProvider()), 
      ),
      ChangeNotifierProvider(
        create: ((context) => WalletProvider()), 
      ),
      ChangeNotifierProvider(
        create: ((context) => OpsProvider()), 
      )
    ],
    child: MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      )
    )
  );
}


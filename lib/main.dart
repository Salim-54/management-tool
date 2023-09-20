import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:management_tool/providers/functionality_provider.dart';
import 'package:management_tool/providers/request_provider.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/client_provide.dart';
import 'providers/item_provider.dart';
import 'screens/splash/splash.dart';
import 'theme/app_theme.dart';
import 'utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    dio.options.baseUrl = Constants.BASE_URL;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(dio)),
        ChangeNotifierProvider(create: (_) => FunctionalityProvider()),
        ChangeNotifierProxyProvider<AuthProvider, ClientsProvider>(
          create: (_) => ClientsProvider(dio),
          update: (_, auth, previousClients) =>
              previousClients!..update(auth.token!, previousClients.items),
        ),
        ChangeNotifierProxyProvider<AuthProvider, RequestProvider>(
          create: (_) => RequestProvider(dio),
          update: (_, auth, previousClients) =>
              previousClients!..update(auth.token!, previousClients.items),
        ),
        ChangeNotifierProxyProvider<AuthProvider, ItemsProvider>(
          create: (_) => ItemsProvider(dio),
          update: (_, auth, previousClients) =>
              previousClients!..update(auth.token!, previousClients.items),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const SplashScreen(),
      ),
    );
  }
}

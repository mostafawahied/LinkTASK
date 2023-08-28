import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:link_task/home/presentation/screens/home_screen.dart';
import 'package:link_task/router/router.dart';
import 'package:link_task/router/routes_constants.dart';
import 'package:link_task/utils/global_binding.dart';
import 'package:link_task/utils/service_locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesConstants.home,
      getPages: AppRouter.routes,
      initialBinding: GlobalBindings(),
      onGenerateRoute: (RouteSettings route) {
        var uri = Uri.parse(route.name!);
        switch (uri.path) {
          case "/":
            return MaterialPageRoute(
              settings: route,
              builder: (context) => const HomeScreen(),
            );
          default:
            return MaterialPageRoute(
              settings: route,
              builder: (context) => const HomeScreen(),
            );
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: Container()),
    );
  }
}
